// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.runtime._SafeStr_20

package com.sulake.core.runtime
{
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import __AS3__.vec.Vector;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.core.runtime.exceptions.InvalidComponentException;
    import com.sulake.core.utils.ClassUtils;
    import flash.events.IEventDispatcher;
    import com.sulake.core.runtime.exceptions.ComponentDisposedException;
    import flash.events.Event;
    import com.sulake.core.runtime.events.LockEvent;
    import flash.utils.getQualifiedClassName;
    import flash.utils.Dictionary;
    import com.sulake.core.runtime.exceptions.*;

    [SecureSWF(rename="true")]
    public class _SafeStr_20 implements IUnknown, _SafeStr_19 
    {

        public static const COMPONENT_EVENT_RUNNING:String = "COMPONENT_EVENT_RUNNING";
        public static const COMPONENT_EVENT_DISPOSING:String = "COMPONENT_EVENT_DISPOSING";
        public static const COMPONENT_EVENT_WARNING:String = "COMPONENT_EVENT_WARNING";
        public static const COMPONENT_EVENT_ERROR:String = "COMPONENT_EVENT_ERROR";
        public static const COMPONENT_EVENT_DEBUG:String = "COMPONENT_EVENT_DEBUG";
        public static const COMPONENT_EVENT_UNLOCKED:String = "COMPONENT_EVENT_UNLOCKED";
        public static const COMPONENT_EVENT_REBOOT:String = "COMPONENT_EVENT_REBOOT";
        protected static const INTERNAL_EVENT_UNLOCKED:String = "_INTERNAL_EVENT_UNLOCKED";
        public static const COMPONENT_FLAG_NULL:uint = 0;
        public static const COMPONENT_FLAG_INTERFACE:uint = 1;
        public static const COMPONENT_FLAG_CONTEXT:uint = 2;
        public static const COMPONENT_FLAG_DISPOSABLE:uint = 4;

        protected var _SafeStr_8044:uint = 0;
        protected var _lastError:String = "";
        protected var _SafeStr_8045:String = "";
        protected var _SafeStr_4904:String = "";
        private var _assets:_SafeStr_21;
        private var _SafeStr_3983:EventDispatcherWrapper;
        private var _SafeStr_6583:uint;
        private var _SafeStr_8046:InterfaceStructList;
        private var _context:_SafeStr_31 = null;
        private var _disposed:Boolean = false;
        private var _SafeStr_5213:Boolean = false;
        private var _SafeStr_8047:int = 1;
        private var _SafeStr_8043:Vector.<String>;
        private var _SafeStr_8048:Vector.<Function> = new Vector.<Function>(0);

        public function _SafeStr_20(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            _SafeStr_6583 = _arg_2;
            _SafeStr_8046 = new InterfaceStructList();
            _SafeStr_3983 = new EventDispatcherWrapper();
            _context = _arg_1;
            _assets = ((_arg_3 != null) ? _arg_3 : new AssetLibrary("_internal_asset_library"));
            if (_context == null)
            {
                throw (new InvalidComponentException("IContext not provided to Component's constructor!"));
            };
            if (dependencies.length > 0)
            {
                lock();
            };
            _SafeStr_8043 = new Vector.<String>(0);
            for each (var _local_4:ComponentDependency in dependencies)
            {
                if (_local_4.isRequired)
                {
                    _SafeStr_8043.push(ClassUtils.getSimpleQualifiedClassName(_local_4.identifier));
                };
                injectDependency(_local_4.identifier, _local_4.dependencySetter, _local_4.isRequired, _local_4.eventListeners);
            };
            allDependenciesRequested();
        }

        public static function getInterfaceStructList(_arg_1:_SafeStr_20):InterfaceStructList
        {
            return (_arg_1._SafeStr_8046);
        }


        public function get locked():Boolean
        {
            return (_SafeStr_5213);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get context():_SafeStr_31
        {
            return (_context);
        }

        public function get events():IEventDispatcher
        {
            return (_SafeStr_3983);
        }

        public function get assets():_SafeStr_21
        {
            return (_assets);
        }

        private function injectDependency(_arg_1:IID, _arg_2:Function, _arg_3:Boolean, _arg_4:Array):void
        {
            var identifier = _arg_1;
            var dependencySetter = _arg_2;
            var isRequired = _arg_3;
            var eventListeners = _arg_4;
            if (isRequired)
            {
                _SafeStr_8047++;
            };
            queueInterface(identifier, (function (_arg_1:Function, _arg_2:Boolean, _arg_3:Array, _arg_4:String):Function
            {
                var setter = _arg_1;
                var required = _arg_2;
                var listeners = _arg_3;
                var componentName = _arg_4;
                return (function (_arg_1:IID, _arg_2:IUnknown):void
                {
                    var identifier = _arg_1;
                    var unknown = _arg_2;
                    if (disposed)
                    {
                        return;
                    };
                    if (setter != null)
                    {
                        (setter(unknown));
                    };
                    if (listeners != null)
                    {
                        var eventDispatcher:IEventDispatcher = _SafeStr_20(unknown).events;
                        for each (var listener:Object in listeners)
                        {
                            eventDispatcher.addEventListener(listener.type, listener.callback);
                        };
                    };
                    _SafeStr_8048.push((function (_arg_1:IID, _arg_2:IUnknown):Function
                    {
                        var iid = _arg_1;
                        var component = _arg_2;
                        return (function ():void
                        {
                            var _local_2:* = null;
                            if (listeners != null)
                            {
                                _local_2 = _SafeStr_20(component).events;
                                if (_local_2 != null)
                                {
                                    for each (var _local_1:Object in listeners)
                                    {
                                        _local_2.removeEventListener(_local_1.type, _local_1.callback);
                                    };
                                };
                            };
                            if (setter != null)
                            {
                                (setter(null));
                            };
                            component.release(iid);
                        });
                    })(identifier, unknown));
                    if (required)
                    {
                        allDependenciesRequested(ClassUtils.getSimpleQualifiedClassName(identifier));
                    };
                });
            })(dependencySetter, isRequired, eventListeners, ClassUtils.getSimpleQualifiedClassName(this)));
        }

        private function allDependenciesRequested(_arg_1:String=""):void
        {
            _SafeStr_8047--;
            if (((!(_arg_1 == "")) && (_SafeStr_8043.indexOf(_arg_1) > -1)))
            {
                _SafeStr_8043.splice(_SafeStr_8043.indexOf(_arg_1), 1);
            };
            if (_SafeStr_8047 == 0)
            {
                initComponent();
                unlock();
            };
        }

        protected function get allRequiredDependenciesInjected():Boolean
        {
            return (_SafeStr_8047 == 0);
        }

        protected function get dependencies():Vector.<ComponentDependency>
        {
            return (new Vector.<ComponentDependency>(0));
        }

        protected function initComponent():void
        {
        }

        public function queueInterface(_arg_1:IID, _arg_2:Function=null):IUnknown
        {
            var _local_3:InterfaceStruct = _SafeStr_8046.getStructByInterface(_arg_1);
            if (_local_3 == null)
            {
                return (_context.queueInterface(_arg_1, _arg_2));
            };
            if (_disposed)
            {
                throw (new ComponentDisposedException((('Failed to queue interface trough disposed Component "' + ClassUtils.getSimpleQualifiedClassName(this)) + '"!')));
            };
            if (_SafeStr_5213)
            {
                return (null);
            };
            _local_3.reserve();
            var _local_4:IUnknown = (_local_3.unknown as IUnknown);
            if (_arg_2 != null)
            {
                (_arg_2(_arg_1, _local_4));
            };
            return (_local_4);
        }

        public function release(_arg_1:IID):uint
        {
            if (_disposed)
            {
                return (0);
            };
            var _local_2:InterfaceStruct = _SafeStr_8046.getStructByInterface(_arg_1);
            if (_local_2 == null)
            {
                _lastError = (("Attempting to release unknown interface:" + _arg_1) + "!");
                throw (new Error(_lastError));
            };
            var _local_3:uint = _local_2.release();
            if ((_SafeStr_6583 & 0x04))
            {
                if (_local_3 == 0)
                {
                    if (_SafeStr_8046.getTotalReferenceCount() == 0)
                    {
                        _context.detachComponent(this);
                        this.dispose();
                    };
                };
            };
            return (_local_3);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                for each (var _local_1:Function in _SafeStr_8048)
                {
                    (_local_1());
                };
                _SafeStr_8048 = null;
                _SafeStr_3983.dispatchEvent(new Event("COMPONENT_EVENT_DISPOSING"));
                _SafeStr_3983 = null;
                _SafeStr_8046.dispose();
                _SafeStr_8046 = null;
                _assets.dispose();
                _assets = null;
                _context = null;
                _SafeStr_8044 = 0;
                _disposed = true;
            };
        }

        public function purge():void
        {
        }

        final protected function lock():void
        {
            if (!_SafeStr_5213)
            {
                _SafeStr_5213 = true;
            };
        }

        final protected function unlock():void
        {
            if (_SafeStr_5213)
            {
                _SafeStr_5213 = false;
                _SafeStr_3983.dispatchEvent(new LockEvent("_INTERNAL_EVENT_UNLOCKED", this));
            };
        }

        public function toString():String
        {
            return (((("[component " + ClassUtils.getSimpleQualifiedClassName(this)) + " refs: ") + _SafeStr_8044) + "]");
        }

        public function toXMLString(_arg_1:uint=0):String
        {
            var _local_7:uint;
            var _local_3:* = null;
            var _local_8:uint;
            var _local_4:String = "";
            _local_7 = 0;
            while (_local_7 < _arg_1)
            {
                _local_4 = (_local_4 + "\t");
                _local_7++;
            };
            var _local_5:String = getQualifiedClassName(this);
            var _local_2:String = "";
            _local_2 = (_local_2 + (((_local_4 + '<component class="') + _local_5) + '">\n'));
            var _local_6:uint = _SafeStr_8046.length;
            _local_8 = 0;
            while (_local_8 < _local_6)
            {
                _local_3 = _SafeStr_8046.getStructByIndex(_local_8);
                _local_2 = (_local_2 + (((((_local_4 + '\t<interface iid="') + _local_3.iis) + '" refs="') + _local_3.references) + '"/>\n'));
                _local_8++;
            };
            return (_local_2 + (_local_4 + "</component>\n"));
        }

        public function get requiredDependencyIids():Vector.<String>
        {
            return (_SafeStr_8043);
        }

        public function registerUpdateReceiver(_arg_1:_SafeStr_41, _arg_2:uint):void
        {
            if (!_disposed)
            {
                _context.registerUpdateReceiver(_arg_1, _arg_2);
            };
        }

        public function removeUpdateReceiver(_arg_1:_SafeStr_41):void
        {
            if (!_disposed)
            {
                _context.removeUpdateReceiver(_arg_1);
            };
        }

        public function get flags():uint
        {
            return (_SafeStr_6583);
        }

        public function propertyExists(_arg_1:String):Boolean
        {
            return ((_context.configuration) ? _context.configuration.propertyExists(_arg_1) : false);
        }

        public function getProperty(_arg_1:String, _arg_2:Dictionary=null):String
        {
            return ((_context.configuration) ? _context.configuration.getProperty(_arg_1, _arg_2) : "");
        }

        public function setProperty(_arg_1:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false):void
        {
            if (_context.configuration)
            {
                _context.configuration.setProperty(_arg_1, _arg_2, _arg_3, _arg_4);
            };
        }

        public function getBoolean(_arg_1:String):Boolean
        {
            return ((_context.configuration) ? _context.configuration.getBoolean(_arg_1) : false);
        }

        public function getInteger(_arg_1:String, _arg_2:int):int
        {
            return ((_context.configuration) ? _context.configuration.getInteger(_arg_1, _arg_2) : 0);
        }

        public function interpolate(_arg_1:String):String
        {
            return ((_context.configuration) ? _context.configuration.interpolate(_arg_1) : "");
        }

        public function updateUrlProtocol(_arg_1:String):String
        {
            return ((_context.configuration) ? _context.configuration.updateUrlProtocol(_arg_1) : "");
        }


    }
}//package com.sulake.core.runtime

// _SafeStr_19 = "_-01r" (String#6494, DoABC#3)
// _SafeStr_20 = "_-W1o" (String#8724, DoABC#3)
// _SafeStr_21 = "_-61a" (String#6965, DoABC#3)
// _SafeStr_31 = "_-Ee" (String#7513, DoABC#3)
// _SafeStr_3983 = "_-OX" (String#71, DoABC#3)
// _SafeStr_41 = "_-m5" (String#9820, DoABC#3)
// _SafeStr_4904 = "_-bo" (String#9093, DoABC#3)
// _SafeStr_5213 = "_-h18" (String#9458, DoABC#3)
// _SafeStr_6583 = "_-61n" (String#6972, DoABC#3)
// _SafeStr_8043 = "_-B9" (String#7325, DoABC#3)
// _SafeStr_8044 = "_-o1A" (String#9924, DoABC#3)
// _SafeStr_8045 = "_-618" (String#6942, DoABC#3)
// _SafeStr_8046 = "_-n1j" (String#9886, DoABC#3)
// _SafeStr_8047 = "_-Q1z" (String#8306, DoABC#3)
// _SafeStr_8048 = "_-22f" (String#6673, DoABC#3)


