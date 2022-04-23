﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.runtime._SafeStr_799

package com.sulake.core.runtime
{
    import __AS3__.vec.Vector;
    import com.sulake.core.utils._SafeStr_39;
    import flash.display.DisplayObjectContainer;
    import flash.display.Sprite;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.core.assets._SafeStr_21;
    import flash.events.Event;
    import com.sulake.core.runtime.events.WarningEvent;
    import com.sulake.core.runtime.events.ErrorEvent;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import com.sulake.core.utils._SafeStr_43;
    import flash.system.ApplicationDomain;
    import flash.utils.ByteArray;
    import com.sulake.core.assets.AssetLibrary;
    import flash.utils.getDefinitionByName;
    import com.sulake.core.runtime.exceptions.InvalidComponentException;
    import flash.utils.getQualifiedClassName;
    import com.sulake.core.runtime.events.LockEvent;

    [SecureSWF(rename="true")]
    public class _SafeStr_799 extends _SafeStr_20 implements _SafeStr_31 
    {

        protected var _loaders:Vector.<_SafeStr_39>;
        protected var _SafeStr_4414:Boolean = false;
        private var _configuration:_SafeStr_19;

        protected var _SafeStr_8049:DisplayObjectContainer = new Sprite();
        protected var _SafeStr_8050:Vector.<_SafeStr_20> = new Vector.<_SafeStr_20>();
        protected var _SafeStr_8051:Vector.<_SafeStr_1526> = new Vector.<_SafeStr_1526>();
        private var _linkEventTrackers:Vector.<ILinkEventTracker> = new Vector.<ILinkEventTracker>(0);

        public function _SafeStr_799(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, (_arg_2 | 0x02), _arg_3);
        }

        public function get root():_SafeStr_31
        {
            if (((!(context)) || (context == this)))
            {
                return (this);
            };
            return (context.root);
        }

        public function get displayObjectContainer():DisplayObjectContainer
        {
            return (_SafeStr_8049);
        }

        override public function purge():void
        {
            super.purge();
            for each (var _local_1:_SafeStr_20 in _SafeStr_8050)
            {
                if (_local_1 != this)
                {
                    _local_1.purge();
                };
            };
        }

        public function debug(_arg_1:String):void
        {
            _SafeStr_8045 = _arg_1;
            if (((_SafeStr_4414) && (events)))
            {
                events.dispatchEvent(new Event("COMPONENT_EVENT_DEBUG"));
            };
        }

        public function getLastDebugMessage():String
        {
            return (_SafeStr_8045);
        }

        public function warning(_arg_1:String):void
        {
            _SafeStr_4904 = _arg_1;
            if (events != null)
            {
                events.dispatchEvent(new WarningEvent("COMPONENT_EVENT_WARNING", _arg_1));
            };
        }

        public function getLastWarningMessage():String
        {
            return (_SafeStr_4904);
        }

        public function error(_arg_1:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void
        {
            _lastError = _arg_1;
            if (events != null)
            {
                events.dispatchEvent(new ErrorEvent("COMPONENT_EVENT_ERROR", _arg_1, _arg_2, _arg_3, _arg_4));
            };
        }

        public function getLastErrorMessage():String
        {
            return (_lastError);
        }

        final public function loadFromFile(_arg_1:URLRequest, _arg_2:LoaderContext):_SafeStr_39
        {
            var _local_3:* = null;
            if (_loaders == null)
            {
                _loaders = new Vector.<_SafeStr_39>();
            };
            for each (_local_3 in _loaders)
            {
                if (_local_3.url == _arg_1.url)
                {
                    return (_local_3);
                };
            };
            _local_3 = new _SafeStr_39(_arg_2, _SafeStr_4414);
            _local_3.addEventListener("LIBRARY_LOADER_EVENT_COMPLETE", loadReadyHandler, false);
            _local_3.addEventListener("LIBRARY_LOADER_EVENT_ERROR", loadErrorHandler, false);
            _local_3.addEventListener("LIBRARY_LOADER_EVENT_DEBUG", loadDebugHandler, false);
            _local_3.load(_arg_1);
            _loaders.push(_local_3);
            return (_local_3);
        }

        final protected function loadReadyHandler(_arg_1:_SafeStr_43):void
        {
            var _local_2:_SafeStr_39 = (_arg_1.target as _SafeStr_39);
            removeLibraryLoader(_local_2);
            prepareComponent(_local_2.resource, 0, _local_2.domain);
        }

        protected function loadErrorHandler(_arg_1:_SafeStr_43):void
        {
            var _local_2:* = null;
            _local_2 = (_arg_1.target as _SafeStr_39);
            var _local_3:String = _local_2.getLastErrorMessage();
            removeLibraryLoader(_local_2);
            error((((('Failed to download component resource "' + _local_2.url) + '"!') + "\r") + _local_3), true, 5);
        }

        protected function loadDebugHandler(_arg_1:_SafeStr_43):void
        {
            var _local_2:* = null;
            _local_2 = (_arg_1.target as _SafeStr_39);
            var _local_3:String = _local_2.getLastDebugMessage();
            debug(_local_3);
        }

        protected function removeLibraryLoader(_arg_1:_SafeStr_39):void
        {
            _arg_1.removeEventListener("LIBRARY_LOADER_EVENT_COMPLETE", loadReadyHandler, false);
            _arg_1.removeEventListener("LIBRARY_LOADER_EVENT_ERROR", loadReadyHandler, false);
            _arg_1.dispose();
            var _local_2:int = _loaders.indexOf(_arg_1);
            if (_local_2 > -1)
            {
                _loaders.splice(_local_2, 1);
            };
        }

        public function prepareAssetLibrary(_arg_1:XML, _arg_2:Class):Boolean
        {
            return (assets.loadFromResource(_arg_1, _arg_2));
        }

        final public function prepareComponent(_arg_1:Class, _arg_2:uint=0, _arg_3:ApplicationDomain=null):IUnknown
        {
            var _local_11:* = null;
            var _local_16:* = null;
            var _local_23:* = null;
            var _local_8:* = null;
            var _local_4:* = null;
            var _local_13:* = null;
            var _local_21:* = null;
            var _local_5:* = null;
            var _local_9:* = null;
            var _local_7:* = null;
            var _local_10:* = null;
            var _local_18:* = null;
            var _local_19:* = null;
            var _local_6:* = null;
            var _local_14:uint;
            var _local_17:* = null;
            var _local_20:* = null;
            var _local_15:uint;
            if (_arg_3 == null)
            {
                _arg_3 = ApplicationDomain.currentDomain;
            };
            try
            {
                _local_16 = (_arg_1 as Object).manifest;
                if ((_local_16 is XML))
                {
                    _local_11 = (_local_16 as XML);
                }
                else
                {
                    if ((_local_16 is Class))
                    {
                        _local_23 = (new ((_local_16 as Class))() as ByteArray);
                        _local_11 = new XML(_local_23.readUTFBytes(_local_23.length));
                    };
                };
            }
            catch(e:Error)
            {
                _local_11 = null;
            };
            if (_local_11 == null)
            {
                return (null);
            };
            var _local_12:XMLList = _local_11.child("component");
            _local_14 = 0;
            while (_local_14 < _local_12.length())
            {
                _local_6 = _local_12[_local_14];
                _local_18 = _local_6.attribute("version");
                _local_4 = _local_6.attribute("class");
                _local_17 = _local_6.child("assets");
                var _local_22:XMLList = _local_6.child("aliases");
                var _local_24:_SafeStr_21 = null;
                if (_local_17.length() > 0)
                {
                    _local_20 = new XML("<manifest><library /></manifest>");
                    _local_20.library.appendChild(_local_17);
                    _local_20.library.appendChild(_local_22);
                    _local_24 = new AssetLibrary(("_assets@" + _local_4), _local_20);
                    _local_24.loadFromResource(_local_20, _arg_1);
                };
                _local_8 = (_arg_3.getDefinition(_local_4) as Class);
                if (_local_8 == null)
                {
                    _local_8 = (getDefinitionByName(_local_4) as Class);
                };
                if (_local_8 == null)
                {
                    error((("Invalid component class " + _local_4) + "!"), true, 4);
                    return (null);
                };
                _local_21 = ((_local_24 == null) ? new _local_8(this, _arg_2) : new _local_8(this, _arg_2, _local_24));
                if (_local_21 != null)
                {
                    if (_local_24 != null)
                    {
                        if (_local_21.assets != _local_24)
                        {
                            _local_24.dispose();
                            error((('Component "' + _local_4) + '" did not save provided asset library!'), true, 4);
                        };
                    };
                    _local_13 = _local_6.child("interface");
                    _local_5 = [];
                    _local_15 = 0;
                    while (_local_15 < _local_13.length())
                    {
                        _local_7 = _local_13[_local_15].attribute("iid");
                        _local_9 = (_arg_3.getDefinition(_local_7) as Class);
                        if (_local_9 == null)
                        {
                            _local_9 = (getDefinitionByName(_local_7) as Class);
                        };
                        if (_local_9 == null)
                        {
                            throw (new InvalidComponentException(("Identifier class defined in manifest not found: " + _local_7)));
                        };
                        _local_10 = new (_local_9)();
                        _local_19 = (_local_21 as IUnknown);
                        getInterfaceStructList(_local_21).insert(new InterfaceStruct(_local_10, _local_21));
                        _local_5.push(_local_10);
                        _local_15++;
                    };
                    attachComponent(_local_21, _local_5);
                };
                _local_14++;
            };
            return (_local_21 as IUnknown);
        }

        final public function attachComponent(_arg_1:_SafeStr_20, _arg_2:Array):void
        {
            var _local_6:uint;
            var _local_4:* = null;
            var _local_3:* = null;
            if (_SafeStr_8050 == null)
            {
                return;
            };
            if (_SafeStr_8050.indexOf(_arg_1) > -1)
            {
                error((("Component " + _arg_1) + " already attached to context!"), false);
                return;
            };
            _SafeStr_8050.push(_arg_1);
            if (_arg_1.locked)
            {
                _arg_1.events.addEventListener("_INTERNAL_EVENT_UNLOCKED", unlockEventHandler);
            };
            var _local_5:uint = _arg_2.length;
            _local_6 = 0;
            while (_local_6 < _local_5)
            {
                _local_4 = _arg_2[_local_6];
                if (getInterfaceStructList(_arg_1).find(_local_4) == null)
                {
                    getInterfaceStructList(_arg_1).insert(new InterfaceStruct(_local_4, _arg_1));
                };
                getInterfaceStructList(this).insert(new InterfaceStruct(_local_4, _arg_1));
                _local_6++;
            };
            if (!_arg_1.locked)
            {
                _local_6 = 0;
                while (_local_6 < _local_5)
                {
                    _local_3 = _arg_2[_local_6];
                    if (hasQueueForInterface(_local_3))
                    {
                        announceInterfaceAvailability(_local_3, _arg_1);
                    };
                    _local_6++;
                };
            };
        }

        final public function detachComponent(_arg_1:_SafeStr_20):void
        {
            var _local_2:* = null;
            var _local_4:uint;
            var _local_5:InterfaceStructList = getInterfaceStructList(this);
            var _local_3:int = _local_5.getIndexByImplementor(_arg_1);
            while (_local_3 > -1)
            {
                _local_2 = _local_5.remove(_local_3);
                _local_3 = _local_5.getIndexByImplementor(_arg_1);
            };
            _local_4 = 0;
            while (_local_4 < _SafeStr_8050.length)
            {
                if (_SafeStr_8050[_local_4] == _arg_1)
                {
                    _SafeStr_8050.splice(_local_4, 1);
                    _arg_1.events.removeEventListener("_INTERNAL_EVENT_UNLOCKED", unlockEventHandler);
                    return;
                };
                _local_4++;
            };
        }

        override public function queueInterface(_arg_1:IID, _arg_2:Function=null):IUnknown
        {
            var _local_5:* = null;
            var _local_4:InterfaceStructList = getInterfaceStructList(this);
            if (_local_4 == null)
            {
                return (null);
            };
            var _local_3:InterfaceStruct = _local_4.getStructByInterface(_arg_1);
            if (_local_3 != null)
            {
                if (((_local_3.unknown == this) && (_local_3.iis == getQualifiedClassName(_arg_1))))
                {
                    return (super.queueInterface(_arg_1, _arg_2));
                };
                _local_5 = _local_3.unknown.queueInterface(_arg_1, _arg_2);
                if (_local_5)
                {
                    return (_local_5);
                };
            };
            if (_arg_2 != null)
            {
                addQueueeForInterface(_arg_1, _arg_2);
                if (((context) && (!(context == this))))
                {
                    context.queueInterface(_arg_1, announceInterfaceAvailability);
                };
            };
            return (null);
        }

        final protected function addQueueeForInterface(_arg_1:IID, _arg_2:Function):void
        {
            var _local_3:* = null;
            if (hasQueueForInterface(_arg_1))
            {
                _local_3 = getQueueForInterface(_arg_1);
            }
            else
            {
                _local_3 = new _SafeStr_1526(_arg_1);
                _SafeStr_8051.push(_local_3);
            };
            _local_3.receivers.unshift(_arg_2);
        }

        final protected function hasQueueForInterface(_arg_1:IID):Boolean
        {
            var _local_4:uint;
            if (_SafeStr_8051 == null)
            {
                return (false);
            };
            var _local_2:String = getQualifiedClassName(_arg_1);
            var _local_3:uint = _SafeStr_8051.length;
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                if (getQualifiedClassName(_SafeStr_8051[_local_4].identifier) == _local_2)
                {
                    return (true);
                };
                _local_4++;
            };
            return (false);
        }

        final protected function getQueueForInterface(_arg_1:IID):_SafeStr_1526
        {
            var _local_5:* = null;
            var _local_4:uint;
            var _local_2:String = getQualifiedClassName(_arg_1);
            var _local_3:uint = _SafeStr_8051.length;
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_5 = _SafeStr_8051[_local_4];
                if (getQualifiedClassName(_local_5.identifier) == _local_2)
                {
                    return (_local_5);
                };
                _local_4++;
            };
            return (null);
        }

        final protected function announceInterfaceAvailability(_arg_1:IID, _arg_2:_SafeStr_20):void
        {
            var _local_6:* = null;
            var _local_4:uint;
            var _local_5:_SafeStr_1526 = getQueueForInterface(_arg_1);
            if (_local_5 == null)
            {
                return;
            };
            var _local_3:uint = _local_5.receivers.length;
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_6 = _arg_2.queueInterface(_arg_1);
                if (_local_6 == null)
                {
                    error((("Interface " + _arg_1) + " still unavailable!"), true, 6);
                };
                if (_local_5.receivers != null)
                {
                    (_local_5.receivers.pop()(_arg_1, _local_6));
                };
                _local_4++;
            };
        }

        override public function dispose():void
        {
            var _local_2:uint;
            var _local_1:* = null;
            if (!disposed)
            {
                super.dispose();
                if (_SafeStr_8050 != null)
                {
                    _local_2 = _SafeStr_8050.length;
                    while (_local_2-- > 0)
                    {
                        IUnknown(_SafeStr_8050.pop()).dispose();
                    };
                    _SafeStr_8050 = null;
                };
                if (_SafeStr_8051 != null)
                {
                    _local_2 = _SafeStr_8051.length;
                    while (_local_2-- > 0)
                    {
                        _SafeStr_13(_SafeStr_8051.pop()).dispose();
                    };
                    _SafeStr_8051 = null;
                };
                if (_loaders != null)
                {
                    _local_2 = _loaders.length;
                    while (_local_2-- > 0)
                    {
                        _local_1 = _loaders[0];
                        removeLibraryLoader(_local_1);
                        _local_1.dispose();
                    };
                    _loaders = null;
                };
            };
        }

        private function unlockEventHandler(_arg_1:LockEvent):void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_3:_SafeStr_20 = (_arg_1.unknown as _SafeStr_20);
            if (!_local_3.disposed)
            {
                _local_3.events.removeEventListener("_INTERNAL_EVENT_UNLOCKED", unlockEventHandler);
            };
            if (!disposed)
            {
                _local_4 = [];
                getInterfaceStructList(this).mapStructsByImplementor(_local_3, _local_4);
                while ((((_local_4.length) && (!(_local_3.disposed))) && (!(disposed))))
                {
                    _local_2 = _local_4.pop();
                    announceInterfaceAvailability(_local_2.iid, _local_3);
                };
                root.events.dispatchEvent(new Event("COMPONENT_EVENT_UNLOCKED"));
            };
        }

        override public function toXMLString(_arg_1:uint=0):String
        {
            var _local_9:uint;
            var _local_3:* = null;
            var _local_10:uint;
            var _local_4:* = null;
            var _local_11:uint;
            var _local_6:String = "";
            _local_9 = 0;
            while (_local_9 < _arg_1)
            {
                _local_6 = (_local_6 + "\t");
                _local_9++;
            };
            var _local_7:String = getQualifiedClassName(this);
            var _local_2:String = "";
            _local_2 = (_local_2 + (((_local_6 + '<context class="') + _local_7) + '" >\n'));
            var _local_5:Array = [];
            var _local_8:uint = getInterfaceStructList(this).mapStructsByImplementor(this, _local_5);
            _local_10 = 0;
            while (_local_10 < _local_8)
            {
                _local_3 = _local_5[_local_10];
                _local_2 = (_local_2 + (((((_local_6 + '\t<interface iid="') + _local_3.iis) + '" refs="') + _local_3.references) + '"/>\n'));
                _local_10++;
            };
            _local_11 = 0;
            while (_local_11 < _SafeStr_8050.length)
            {
                _local_4 = (_SafeStr_8050[_local_11] as _SafeStr_20);
                if (_local_4 != this)
                {
                    _local_2 = (_local_2 + _local_4.toXMLString((_arg_1 + 1)));
                };
                _local_11++;
            };
            return (_local_2 + (_local_6 + "</context>\n"));
        }

        public function set configuration(_arg_1:_SafeStr_19):void
        {
            _configuration = _arg_1;
        }

        public function get configuration():_SafeStr_19
        {
            return (_configuration);
        }

        public function addLinkEventTracker(_arg_1:ILinkEventTracker):void
        {
            if (_linkEventTrackers.indexOf(_arg_1) < 0)
            {
                _linkEventTrackers.push(_arg_1);
            };
        }

        public function removeLinkEventTracker(_arg_1:ILinkEventTracker):void
        {
            var _local_2:int = _linkEventTrackers.indexOf(_arg_1);
            if (_local_2 > -1)
            {
                _linkEventTrackers.splice(_local_2, 1);
            };
        }

        public function createLinkEvent(_arg_1:String):void
        {
            for each (var _local_2:ILinkEventTracker in _linkEventTrackers)
            {
                if (_local_2.linkPattern.length > 0)
                {
                    if (_arg_1.substr(0, _local_2.linkPattern.length) == _local_2.linkPattern)
                    {
                        _local_2.linkReceived(_arg_1);
                    };
                }
                else
                {
                    _local_2.linkReceived(_arg_1);
                };
            };
        }

        public function get linkEventTrackers():Vector.<ILinkEventTracker>
        {
            return (_linkEventTrackers);
        }


    }
}//package com.sulake.core.runtime

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1526 = "_-B1o" (String#7321, DoABC#3)
// _SafeStr_19 = "_-01r" (String#6494, DoABC#3)
// _SafeStr_20 = "_-W1o" (String#8724, DoABC#3)
// _SafeStr_21 = "_-61a" (String#6965, DoABC#3)
// _SafeStr_31 = "_-Ee" (String#7513, DoABC#3)
// _SafeStr_39 = "_-N4" (String#8085, DoABC#3)
// _SafeStr_43 = "_-gV" (String#9427, DoABC#3)
// _SafeStr_4414 = "_-SP" (String#8443, DoABC#3)
// _SafeStr_4904 = "_-bo" (String#9093, DoABC#3)
// _SafeStr_799 = "_-Vy" (String#8655, DoABC#3)
// _SafeStr_8045 = "_-618" (String#6942, DoABC#3)
// _SafeStr_8049 = "_-Z1m" (String#8911, DoABC#3)
// _SafeStr_8050 = "_-rj" (String#10166, DoABC#3)
// _SafeStr_8051 = "_-r1f" (String#10137, DoABC#3)


