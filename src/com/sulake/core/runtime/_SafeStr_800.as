// by nota

//com.sulake.core.runtime._SafeStr_800

package com.sulake.core.runtime
{
    import com.sulake.core.utils._SafeStr_68;
    import com.sulake.core.utils.LibraryLoaderQueue;
    import flash.events.IEventDispatcher;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.AssetLibraryCollection;
    import flash.utils.getTimer;
    import com.sulake.core.utils.profiler.ProfilerViewer;
    import flash.display.DisplayObjectContainer;
    import com.sulake.core._SafeStr_79;
    import flash.utils.ByteArray;
    import flash.events.Event;
    import com.sulake.core.utils._SafeStr_1493;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import com.sulake.core.utils._SafeStr_39;
    import flash.net.URLRequest;
    import com.sulake.core.utils._SafeStr_43;
    import com.sulake.core.runtime.events.LibraryProgressEvent;
    import flash.utils.getQualifiedClassName;

    [SecureSWF(rename="true")]
    public final class _SafeStr_800 extends _SafeStr_799 implements _SafeStr_35 
    {

        private static const NUM_UPDATE_RECEIVER_LEVELS:uint = 3;
        private static const CONFIG_XML_NODE_ASSET_LIBRARIES:String = "asset-libraries";
        private static const CONFIG_XML_NODE_ASSET_LIBRARY:String = "library";
        private static const CONFIG_XML_NODE_SERVICE_LIBRARIES:String = "service-libraries";
        private static const CONFIG_XML_NODE_SERVICE_LIBRARY:String = "library";
        private static const CONFIG_XML_NODE_COMPONENT_LIBRARIES:String = "component-libraries";
        private static const CONFIG_XML_NODE_COMPONENT_LIBRARY:String = "library";

        private static var _SafeStr_8055:_SafeStr_68;

        private var _SafeStr_8056:LibraryLoaderQueue;
        private var _loadingEventDelegate:IEventDispatcher;
        private var _numberOfFilesInConfig:uint;
        private var _SafeStr_8057:Function;
        private var _SafeStr_8054:Profiler;
        private var _SafeStr_8058:_SafeStr_489;
        private var _SafeStr_8052:Array;
        private var _SafeStr_8053:Array;
        private var _lastUpdateTimeMs:uint;
        private var _SafeStr_6583:uint = 0;
        private var _hibernationLevel:int = -1;
        private var _hibernationUpdateFrequency:uint;
        private var _SafeStr_3522:Dictionary;
        private var _rebootOnNextFrame:Boolean;

        public function _SafeStr_800(_arg_1:DisplayObjectContainer, _arg_2:_SafeStr_489, _arg_3:uint, _arg_4:Dictionary)
        {
            var _local_5:uint;
            super(this, 2, new AssetLibraryCollection("_core_assets"));
            if (_arg_4 == null)
            {
                _arg_4 = new Dictionary();
            };
            _SafeStr_3522 = _arg_4;
            _SafeStr_6583 = _arg_3;
            _SafeStr_4414 = ((_arg_3 & 0x0F) == 15);
            _SafeStr_8052 = [];
            _SafeStr_8053 = [];
            _SafeStr_8049 = _arg_1;
            _SafeStr_8058 = _arg_2;
            _local_5 = 0;
            while (_local_5 < 3)
            {
                _SafeStr_8052.push([]);
                _SafeStr_8053.push(0);
                _local_5++;
            };
            _lastUpdateTimeMs = getTimer();
            attachComponent(this, [new IIDCore()]);
            _SafeStr_8049.addEventListener("enterFrame", onEnterFrame);
            switch ((_arg_3 & 0x0F))
            {
                case 0:
                    debug("Core; using simple frame update handler");
                    _SafeStr_8057 = simpleFrameUpdateHandler;
                    return;
                case 1:
                    debug("Core; using complex frame update handler");
                    _SafeStr_8057 = complexFrameUpdateHandler;
                    return;
                case 2:
                    debug("Core; using profiler frame update handler");
                    _SafeStr_8057 = profilerFrameUpdateHandler;
                    _SafeStr_8054 = new Profiler(this);
                    attachComponent(_SafeStr_8054, [new IIDProfiler()]);
                    _SafeStr_8049.addChild(new ProfilerViewer(_SafeStr_8054));
                    return;
                case 4:
                    debug("Core; using experimental frame update handler");
                    _SafeStr_8057 = experimentalFrameUpdateHandler;
                    return;
                case 15:
                    debug("Core; using debug frame update handler");
                    _SafeStr_8057 = debugFrameUpdateHandler;
                default:
            };
        }

        private static function writeObjectToProxy(_arg_1:String, _arg_2:Object):Boolean
        {
            var _local_3:* = null;
            var _local_4:* = null;
            try
            {
                _local_3 = _SafeStr_79.instance.fileProxy;
                if (_local_3)
                {
                    _local_4 = new ByteArray();
                    _local_4.writeObject(_arg_2);
                    _local_3.writeCache(_arg_1, _local_4);
                    var _local_6:Boolean = true;
                    return (_local_6);
                };
                var _local_7:Boolean = false;
                return (_local_7);
            }
            catch(e:Error)
            {
                _SafeStr_14.log(((("Caught error when writing Object (" + _arg_1) + ") to IFileProxy: ") + e.toString()));
                return (false);
            };
            return (false);
        }

        private static function readObjectFromProxy(_arg_1:String):Object
        {
            var _local_2:* = null;
            var _local_3:* = null;
            try
            {
                _local_2 = _SafeStr_79.instance.fileProxy;
                if (_local_2)
                {
                    _local_3 = _local_2.readCache(_arg_1);
                    if (_local_3)
                    {
                        var _local_5:* = _local_3.readObject();
                        return (_local_5);
                    };
                };
                var _local_6:* = null;
                return (_local_6);
            }
            catch(e:Error)
            {
                _SafeStr_14.log(((("Caught error when reading Object (" + _arg_1) + ") from IFileProxy: ") + e.toString()));
                return (null);
            };
            return (null);
        }


        public function set fileProxy(_arg_1:_SafeStr_68):void
        {
            _SafeStr_8055 = _arg_1;
        }

        public function get fileProxy():_SafeStr_68
        {
            return (_SafeStr_8055);
        }

        public function getNumberOfFilesPending():uint
        {
            return (_SafeStr_8056.length);
        }

        public function getNumberOfFilesLoaded():uint
        {
            return (_numberOfFilesInConfig - getNumberOfFilesPending());
        }

        public function get arguments():Dictionary
        {
            return (_SafeStr_3522);
        }

        public function clearArguments():void
        {
            _SafeStr_3522 = new Dictionary();
        }

        public function initialize():void
        {
            if (hasLockedComponents())
            {
                events.addEventListener("COMPONENT_EVENT_UNLOCKED", unlockEventHandler);
            }
            else
            {
                doInitialize();
            };
        }

        private function unlockEventHandler(_arg_1:Event):void
        {
            if (!hasLockedComponents())
            {
                events.removeEventListener("COMPONENT_EVENT_UNLOCKED", unlockEventHandler);
                doInitialize();
            };
        }

        private function doInitialize():void
        {
            events.dispatchEvent(new Event("COMPONENT_EVENT_RUNNING"));
            _SafeStr_1493.start();
        }

        public function hasLockedComponents():Boolean
        {
            if (_SafeStr_8050 != null)
            {
                for each (var _local_1:_SafeStr_20 in _SafeStr_8050)
                {
                    if (_local_1.locked)
                    {
                        return (true);
                    };
                };
            };
            return (false);
        }

        override public function dispose():void
        {
            var _local_2:* = null;
            var _local_1:*;
            var _local_3:uint;
            var _local_4:uint;
            if (!disposed)
            {
                debug("Disposing core");
                _SafeStr_1493.stop();
                try
                {
                    _local_4 = 0;
                    while (_local_4 < 3)
                    {
                        _local_2 = (_SafeStr_8052[_local_4] as Array);
                        _local_3 = _local_2.length;
                        while (_local_3-- > 0)
                        {
                            _local_1 = _local_2.pop();
                            if ((_local_1 is UpdateDelegate))
                            {
                                UpdateDelegate(_local_1).dispose();
                            };
                        };
                        _local_4++;
                    };
                }
                catch(e:Error)
                {
                };
                if (_SafeStr_8049)
                {
                    _SafeStr_8049.removeEventListener("enterFrame", onEnterFrame);
                    _SafeStr_8049 = null;
                };
                if (_SafeStr_8056 != null)
                {
                    _SafeStr_8056.dispose();
                    _SafeStr_8056 = null;
                };
                super.dispose();
            };
        }

        override public function error(_arg_1:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void
        {
            super.error(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_8058.logError(_arg_1, _arg_2, _arg_3, _arg_4);
            if (_arg_2)
            {
                dispose();
            };
        }

        public function readConfigDocument(_arg_1:XML, _arg_2:IEventDispatcher=null):void
        {
            var _local_3:* = null;
            var _local_7:* = null;
            var _local_4:* = null;
            var _local_8:* = null;
            var _local_5:* = null;
            var _local_6:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain, null);
            debug("Parsing config document");
            _loadingEventDelegate = _arg_2;
            if (_SafeStr_8056 == null)
            {
                _SafeStr_8056 = new LibraryLoaderQueue(_SafeStr_4414);
            };
            _local_3 = _arg_1.child("asset-libraries")[0];
            if (_local_3 != null)
            {
                _local_7 = _local_3.child("library");
                for each (_local_4 in _local_7)
                {
                    _local_8 = _local_4.attribute("url").toString();
                    _local_5 = new _SafeStr_39(_local_6, true, _SafeStr_4414);
                    assets.loadFromFile(_local_5, true);
                    _local_5.load(new URLRequest(_local_8));
                    _SafeStr_8056.push(_local_5);
                    _local_5.addEventListener("LIBRARY_LOADER_EVENT_COMPLETE", updateLoadingProcess);
                    _local_5.addEventListener("LIBRARY_LOADER_EVENT_ERROR", errorInLoadingProcess);
                    _numberOfFilesInConfig++;
                };
            };
            _local_3 = _arg_1.child("service-libraries")[0];
            if (_local_3 != null)
            {
                _local_7 = _local_3.child("library");
                for each (_local_4 in _local_7)
                {
                    _local_8 = _local_4.attribute("url").toString();
                    _local_5 = new _SafeStr_39(_local_6, true, _SafeStr_4414);
                    _local_5.load(new URLRequest(_local_8));
                    _SafeStr_8056.push(_local_5);
                    _local_5.addEventListener("LIBRARY_LOADER_EVENT_COMPLETE", updateLoadingProcess);
                    _local_5.addEventListener("LIBRARY_LOADER_EVENT_ERROR", errorInLoadingProcess);
                    _numberOfFilesInConfig++;
                };
            };
            _local_3 = _arg_1.child("component-libraries")[0];
            if (_local_3 != null)
            {
                _local_7 = _local_3.child("library");
                for each (_local_4 in _local_7)
                {
                    _local_8 = _local_4.attribute("url").toString();
                    _local_5 = new _SafeStr_39(_local_6, true, _SafeStr_4414);
                    _local_5.load(new URLRequest(_local_8));
                    _SafeStr_8056.push(_local_5);
                    _local_5.addEventListener("LIBRARY_LOADER_EVENT_COMPLETE", updateLoadingProcess);
                    _local_5.addEventListener("LIBRARY_LOADER_EVENT_ERROR", errorInLoadingProcess);
                    _numberOfFilesInConfig++;
                };
            };
            if (!disposed)
            {
                updateLoadingProcess();
            };
        }

        public function writeDictionaryToProxy(_arg_1:String, _arg_2:Dictionary):Boolean
        {
            return (writeObjectToProxy(_arg_1, _arg_2));
        }

        public function readDictionaryFromProxy(_arg_1:String):Dictionary
        {
            return (readObjectFromProxy(_arg_1) as Dictionary);
        }

        public function writeXMLToProxy(_arg_1:String, _arg_2:XML):Boolean
        {
            return (writeObjectToProxy(_arg_1, _arg_2));
        }

        public function readXMLFromProxy(_arg_1:String):XML
        {
            return (readObjectFromProxy(_arg_1) as XML);
        }

        public function readStringFromProxy(_arg_1:String):String
        {
            var _local_2:* = null;
            var _local_3:* = null;
            try
            {
                _local_2 = _SafeStr_79.instance.fileProxy;
                if (_local_2)
                {
                    _local_3 = _local_2.readCache(_arg_1);
                    if (_local_3)
                    {
                        var _local_5:* = _local_3.readUTFBytes(_local_3.length);
                        return (_local_5);
                    };
                };
                var _local_6:* = null;
                return (_local_6);
            }
            catch(e:Error)
            {
                _SafeStr_14.log(((("Caught error when reading Object (" + _arg_1) + ") from IFileProxy: ") + e.toString()));
                return (null);
            };
            return (null);
        }

        public function writeStringToProxy(_arg_1:String, _arg_2:String):Boolean
        {
            var _local_3:* = null;
            var _local_4:* = null;
            try
            {
                _local_3 = _SafeStr_79.instance.fileProxy;
                if (_local_3)
                {
                    _local_4 = new ByteArray();
                    _local_4.writeUTFBytes(_arg_2);
                    _local_3.writeCache(_arg_1, _local_4);
                    var _local_6:Boolean = true;
                    return (_local_6);
                };
                var _local_7:Boolean = false;
                return (_local_7);
            }
            catch(e:Error)
            {
                _SafeStr_14.log(((("Caught error when writing String (" + _arg_1) + ") to IFileProxy: ") + e.toString()));
                return (false);
            };
            return (false);
        }

        private function errorInLoadingProcess(_arg_1:_SafeStr_43=null):void
        {
            var _local_2:_SafeStr_39 = _SafeStr_39(_arg_1.target);
            error(((((((((('Failed to download library "' + _local_2.url) + '" HTTP status ') + _arg_1.status) + " bytes loaded ") + _arg_1.bytesLoaded) + "/") + _arg_1.bytesTotal) + " : ") + _local_2.getLastErrorMessage()), true, 2);
            if (!disposed)
            {
                updateLoadingProcess(_arg_1);
            };
        }

        private function finalizeLoadingEventDelegate():void
        {
            if (_loadingEventDelegate != null)
            {
                _loadingEventDelegate.dispatchEvent(new Event("complete"));
                _loadingEventDelegate = null;
            };
        }

        private function updateLoadingProgress(_arg_1:_SafeStr_43=null):void
        {
            var _local_2:* = null;
            if (_loadingEventDelegate != null)
            {
                _local_2 = (_arg_1.target as _SafeStr_39);
                _loadingEventDelegate.dispatchEvent(new LibraryProgressEvent(_local_2.url, _arg_1.bytesLoaded, _arg_1.bytesTotal, _local_2.elapsedTime));
            };
        }

        private function updateLoadingProcess(_arg_1:_SafeStr_43=null):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (_arg_1 != null)
            {
                if (((_arg_1.type == "LIBRARY_LOADER_EVENT_COMPLETE") || (_arg_1.type == "LIBRARY_LOADER_EVENT_ERROR")))
                {
                    _local_2 = (_arg_1.target as _SafeStr_39);
                    _local_2.removeEventListener("LIBRARY_LOADER_EVENT_COMPLETE", updateLoadingProcess);
                    _local_2.removeEventListener("LIBRARY_LOADER_EVENT_ERROR", errorInLoadingProcess);
                    _local_2.removeEventListener("LIBRARY_LOADER_EVENT_PROGRESS", updateLoadingProgress);
                    _local_3 = _local_2.url;
                    debug(((('Loading library "' + _local_3) + '" ') + ((_arg_1.type == "LIBRARY_LOADER_EVENT_COMPLETE") ? "ready" : ("failed\n" + _local_2.getLastErrorMessage()))));
                    _local_2.dispose();
                    if (!disposed)
                    {
                        if (_loadingEventDelegate != null)
                        {
                            _loadingEventDelegate.dispatchEvent(new LibraryProgressEvent(_local_2.url, (_numberOfFilesInConfig - _SafeStr_8056.length), _numberOfFilesInConfig, _local_2.elapsedTime));
                        };
                    };
                };
            };
            if (!disposed)
            {
                if (_SafeStr_8056.length == 0)
                {
                    finalizeLoadingEventDelegate();
                    debug("All libraries loaded, Core is now running");
                };
            };
        }

        override public function registerUpdateReceiver(_arg_1:_SafeStr_41, _arg_2:uint):void
        {
            removeUpdateReceiver(_arg_1);
            _arg_2 = ((_arg_2 >= 3) ? (3 - 1) : _arg_2);
            var _local_3:int = ((_SafeStr_8054) ? 2 : (_SafeStr_6583 & 0x0F));
            if (_local_3 == 4)
            {
                _SafeStr_8052[_arg_2].push(new UpdateDelegate(_arg_1, this, _arg_2));
            }
            else
            {
                _SafeStr_8052[_arg_2].push(_arg_1);
            };
        }

        override public function removeUpdateReceiver(_arg_1:_SafeStr_41):void
        {
            var _local_4:* = null;
            var _local_5:int;
            var _local_6:uint;
            if (disposed)
            {
                return;
            };
            var _local_3:int = ((_SafeStr_8054) ? 2 : (_SafeStr_6583 & 0x0F));
            _local_6 = 0;
            while (_local_6 < 3)
            {
                _local_4 = (_SafeStr_8052[_local_6] as Array);
                if (_local_3 == 4)
                {
                    for each (var _local_2:UpdateDelegate in _local_4)
                    {
                        if (_local_2.receiver == _arg_1)
                        {
                            _local_2.dispose();
                            return;
                        };
                    };
                }
                else
                {
                    _local_5 = _local_4.indexOf(_arg_1);
                    if (_local_5 > -1)
                    {
                        _local_4[_local_5] = null;
                        return;
                    };
                };
                _local_6++;
            };
        }

        public function hibernate(_arg_1:int, _arg_2:int=1):void
        {
            if (!hibernating)
            {
                _SafeStr_1493.stop();
                _hibernationLevel = _arg_1;
                _hibernationUpdateFrequency = (1000 / _arg_2);
            };
        }

        public function resume():void
        {
            if (hibernating)
            {
                _SafeStr_1493.start();
                _hibernationLevel = -1;
            };
        }

        private function get hibernating():Boolean
        {
            return (_hibernationLevel > -1);
        }

        private function get maxPriority():uint
        {
            return ((hibernating) ? (_hibernationLevel + 1) : 3);
        }

        private function onEnterFrame(_arg_1:Event):void
        {
            if (_rebootOnNextFrame)
            {
                _SafeStr_8049.removeEventListener("enterFrame", onEnterFrame);
                _rebootOnNextFrame = false;
                events.dispatchEvent(new Event("COMPONENT_EVENT_REBOOT"));
                return;
            };
            var _local_3:uint = getTimer();
            var _local_2:uint = (_local_3 - _lastUpdateTimeMs);
            if (((!(hibernating)) || (_local_2 > _hibernationUpdateFrequency)))
            {
                (_SafeStr_8057(_local_3, _local_2));
                _lastUpdateTimeMs = _local_3;
            };
        }

        private function simpleFrameUpdateHandler(_arg_1:uint, _arg_2:uint):void
        {
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_5:uint;
            var _local_6:uint;
            var _local_7:uint;
            _local_7 = 0;
            while (_local_7 < maxPriority)
            {
                _SafeStr_8053[_local_7] = 0;
                _local_4 = _SafeStr_8052[_local_7];
                _local_6 = 0;
                _local_5 = _local_4.length;
                while (_local_6 != _local_5)
                {
                    _local_3 = _SafeStr_41(_local_4[_local_6]);
                    if (((_local_3 == null) || (_local_3.disposed)))
                    {
                        _local_4.splice(_local_6, 1);
                        _local_5--;
                    }
                    else
                    {
                        try
                        {
                            _local_3.update(_arg_2);
                        }
                        catch(e:Error)
                        {
                            _SafeStr_14.log(e.getStackTrace());
                            error(((('Error in update receiver "' + getQualifiedClassName(_local_3)) + '": ') + e.message), true, e.errorID, e);
                            return;
                        };
                        _local_6++;
                    };
                };
                _local_7++;
            };
        }

        private function complexFrameUpdateHandler(_arg_1:uint, _arg_2:uint):void
        {
            var _local_11:uint;
            var _local_6:* = null;
            var _local_4:* = null;
            var _local_7:uint;
            var _local_9:uint;
            var _local_10:Boolean;
            var _local_5:uint;
            var _local_3:Boolean = true;
            var _local_8:uint = uint((1000 / _SafeStr_8049.stage.frameRate));
            _local_11 = 0;
            while (_local_11 < maxPriority)
            {
                _local_5 = getTimer();
                _local_10 = false;
                if ((_local_5 - _arg_1) > _local_8)
                {
                    if (_SafeStr_8053[_local_11] < _local_11)
                    {
                        _SafeStr_8053[_local_11]++;
                        _local_10 = true;
                    };
                };
                if (!_local_10)
                {
                    _SafeStr_8053[_local_11] = 0;
                    _local_6 = _SafeStr_8052[_local_11];
                    _local_9 = 0;
                    _local_7 = _local_6.length;
                    while (((!(_local_9 == _local_7)) && (_local_3)))
                    {
                        _local_4 = _SafeStr_41(_local_6[_local_9]);
                        if (((_local_4 == null) || (_local_4.disposed)))
                        {
                            _local_6.splice(_local_9, 1);
                            _local_7--;
                        }
                        else
                        {
                            try
                            {
                                _local_4.update(_arg_2);
                            }
                            catch(e:Error)
                            {
                                _SafeStr_14.log(e.getStackTrace());
                                error(((('Error in update receiver "' + getQualifiedClassName(_local_4)) + '": ') + e), true, e.errorID, e);
                                _local_3 = false;
                            };
                            _local_9++;
                        };
                    };
                };
                _local_11++;
            };
        }

        private function profilerFrameUpdateHandler(_arg_1:uint, _arg_2:uint):void
        {
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_5:uint;
            var _local_6:uint;
            var _local_7:uint;
            _SafeStr_8054.start();
            _local_7 = 0;
            while (_local_7 < maxPriority)
            {
                _SafeStr_8053[_local_7] = 0;
                _local_4 = _SafeStr_8052[_local_7];
                _local_6 = 0;
                _local_5 = _local_4.length;
                while (_local_6 != _local_5)
                {
                    _local_3 = _SafeStr_41(_local_4[_local_6]);
                    if (((_local_3 == null) || (_local_3.disposed)))
                    {
                        _local_4.splice(_local_6, 1);
                        _local_5--;
                    }
                    else
                    {
                        try
                        {
                            _SafeStr_8054.update(_local_3, _arg_2);
                        }
                        catch(e:Error)
                        {
                            error(((('Error in update receiver "' + getQualifiedClassName(_local_3)) + '": ') + e.message), true, e.errorID, e);
                            return;
                        };
                        _local_6++;
                    };
                };
                _local_7++;
            };
            _SafeStr_8054.stop();
        }

        private function experimentalFrameUpdateHandler(_arg_1:uint, _arg_2:uint):void
        {
            var _local_5:int;
            var _local_3:* = null;
            var _local_4:int;
            _local_5 = 0;
            while (_local_5 < 3)
            {
                _local_3 = _SafeStr_8052[_local_5];
                _local_4 = (_local_3.length - 1);
                while (_local_4 > -1)
                {
                    if (_local_3[_local_4].disposed)
                    {
                        _local_3.splice(_local_4, 1);
                    };
                    _local_4--;
                };
                _local_5++;
            };
        }

        private function debugFrameUpdateHandler(_arg_1:uint, _arg_2:uint):void
        {
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_5:uint;
            var _local_6:uint;
            var _local_7:uint;
            _local_7 = 0;
            while (_local_7 < maxPriority)
            {
                _SafeStr_8053[_local_7] = 0;
                _local_4 = _SafeStr_8052[_local_7];
                _local_6 = 0;
                _local_5 = _local_4.length;
                while (_local_6 != _local_5)
                {
                    _local_3 = _SafeStr_41(_local_4[_local_6]);
                    if (((_local_3 == null) || (_local_3.disposed)))
                    {
                        _local_4.splice(_local_6, 1);
                        _local_5--;
                    }
                    else
                    {
                        _local_3.update(_arg_2);
                        _local_6++;
                    };
                };
                _local_7++;
            };
        }

        public function setProfilerMode(_arg_1:Boolean):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_4:int;
            var _local_5:int;
            if (_arg_1)
            {
                _SafeStr_8057 = profilerFrameUpdateHandler;
                if (((!(_SafeStr_8054)) || (_SafeStr_8054.disposed)))
                {
                    _SafeStr_8054 = new Profiler(this);
                };
                attachComponent(_SafeStr_8054, [new IIDProfiler()]);
                _local_5 = 0;
                while (_local_5 < 3)
                {
                    _local_3 = _SafeStr_8052[_local_5];
                    _local_4 = (_local_3.length - 1);
                    while (_local_4 > -1)
                    {
                        _local_2 = _local_3[_local_4];
                        if ((_local_2 is UpdateDelegate))
                        {
                            _local_3[_local_4] = UpdateDelegate(_local_2).receiver;
                            UpdateDelegate(_local_2).dispose();
                        };
                        _local_4--;
                    };
                    _local_5++;
                };
            }
            else
            {
                detachComponent(_SafeStr_8054);
                switch ((_SafeStr_6583 & 0x0F))
                {
                    case 0:
                        _SafeStr_8057 = simpleFrameUpdateHandler;
                        return;
                    case 1:
                        _SafeStr_8057 = complexFrameUpdateHandler;
                        return;
                    case 4:
                        _SafeStr_8057 = experimentalFrameUpdateHandler;
                        _local_5 = 0;
                        while (_local_5 < 3)
                        {
                            _local_3 = _SafeStr_8052[_local_5];
                            _local_4 = (_local_3.length - 1);
                            while (_local_4 > -1)
                            {
                                _local_2 = _local_3[_local_4];
                                if ((_local_2 is _SafeStr_41))
                                {
                                    _local_3[_local_4] = new UpdateDelegate(_SafeStr_41(_local_2), this, _local_5);
                                };
                                _local_4--;
                            };
                            _local_5++;
                        };
                        return;
                    default:
                        _SafeStr_8057 = debugFrameUpdateHandler;
                };
            };
        }

        public function set errorLogger(_arg_1:_SafeStr_15):void
        {
            if (_SafeStr_8058 != null)
            {
                _SafeStr_8058.errorLogger = _arg_1;
            };
        }

        public function reboot():void
        {
            _rebootOnNextFrame = true;
        }


    }
}//package com.sulake.core.runtime

import com.sulake.core.runtime._SafeStr_13;
import com.sulake.core.runtime._SafeStr_41;
import com.sulake.core.runtime._SafeStr_31;
import flash.utils.getTimer;
import flash.utils.getQualifiedClassName;
import flash.events.Event;

class UpdateDelegate implements _SafeStr_13 
{

    /*private*/ var _receiver:_SafeStr_41;
    /*private*/ var _context:_SafeStr_31;
    /*private*/ var _priority:int;
    /*private*/ var _lastUpdateTimeMs:uint;
    /*private*/ var _framesSkipped:uint = 0;

    public function UpdateDelegate(_arg_1:_SafeStr_41, _arg_2:_SafeStr_31, _arg_3:int)
    {
        if (((_arg_2) && (_arg_1)))
        {
            _receiver = _arg_1;
            _context = _arg_2;
            _priority = _arg_3;
            _arg_2.displayObjectContainer.stage.addEventListener(((_priority == 0) ? "exitFrame" : "enterFrame"), onFrameUpdate);
            _lastUpdateTimeMs = getTimer();
        };
    }

    public function get priority():int
    {
        return (_priority);
    }

    public function get receiver():_SafeStr_41
    {
        return (_receiver);
    }

    public function get disposed():Boolean
    {
        return ((_receiver) ? _receiver.disposed : true);
    }

    public function dispose():void
    {
        if (_receiver)
        {
            _receiver = null;
            _context.displayObjectContainer.stage.removeEventListener(((_priority == 0) ? "exitFrame" : "enterFrame"), onFrameUpdate);
            _context = null;
        };
    }

    /*private*/ function onFrameUpdate(_arg_1:Event):void
    {
        var _local_2:uint;
        if (!disposed)
        {
            _local_2 = getTimer();
            var _local_3:uint = (_local_2 - _lastUpdateTimeMs);
            _lastUpdateTimeMs = _local_2;
            if (((_priority > 0) && (_framesSkipped < _priority)))
            {
                if (_local_3 > (1000 / _context.displayObjectContainer.stage.frameRate))
                {
                    _framesSkipped++;
                    return;
                };
            };
            _framesSkipped = 0;
            try
            {
                _receiver.update(_local_3);
            }
            catch(e:Error)
            {
                _context.error(((('Error in update receiver "' + getQualifiedClassName(_receiver)) + '": ') + e.message), true, e.errorID, e);
            };
        };
    }


}


// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_1493 = "_-K3" (String#7903, DoABC#3)
// _SafeStr_15 = "_-11j" (String#6554, DoABC#3)
// _SafeStr_20 = "_-W1o" (String#8724, DoABC#3)
// _SafeStr_31 = "_-Ee" (String#7513, DoABC#3)
// _SafeStr_35 = "_-wP" (String#10480, DoABC#3)
// _SafeStr_3522 = "_-J1b" (String#7779, DoABC#3)
// _SafeStr_39 = "_-N4" (String#8085, DoABC#3)
// _SafeStr_41 = "_-m5" (String#9820, DoABC#3)
// _SafeStr_43 = "_-gV" (String#9427, DoABC#3)
// _SafeStr_4414 = "_-SP" (String#8443, DoABC#3)
// _SafeStr_489 = "_-nI" (String#9899, DoABC#3)
// _SafeStr_6583 = "_-61n" (String#6972, DoABC#3)
// _SafeStr_68 = "_-H1s" (String#7683, DoABC#3)
// _SafeStr_79 = "_-411" (String#6798, DoABC#3)
// _SafeStr_799 = "_-Vy" (String#8655, DoABC#3)
// _SafeStr_800 = "_-t11" (String#10239, DoABC#3)
// _SafeStr_8049 = "_-Z1m" (String#8911, DoABC#3)
// _SafeStr_8050 = "_-rj" (String#10166, DoABC#3)
// _SafeStr_8052 = "_-k1H" (String#9669, DoABC#3)
// _SafeStr_8053 = "_-01G" (String#6475, DoABC#3)
// _SafeStr_8054 = "_-71" (String#7007, DoABC#3)
// _SafeStr_8055 = "_-GG" (String#7625, DoABC#3)
// _SafeStr_8056 = "_-c1p" (String#9124, DoABC#3)
// _SafeStr_8057 = "_-u1D" (String#10308, DoABC#3)
// _SafeStr_8058 = "_-Wu" (String#8758, DoABC#3)


