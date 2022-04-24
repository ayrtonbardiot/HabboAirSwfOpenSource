// by nota

//com.sulake.core.window.tools.ProfilerOutput

package com.sulake.core.window.tools
{
    import flash.geom.Point;
    import com.sulake.core.runtime._SafeStr_1099;
    import com.sulake.core.runtime._SafeStr_35;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_1694;
    import com.sulake.core.window.graphics._SafeStr_3119;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.runtime._SafeStr_31;
    import flash.utils.ByteArray;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.core.runtime.IIDProfiler;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.events.Event;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.utils.profiler.ProfilerAgentTask;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;

    public class ProfilerOutput implements _SafeStr_3155 
    {

        private static const ZERO_POINT:Point = new Point();

        private static var profiler_dialog_xml:Class = profiler_dialog_xml$0fe01e3b14ed4333575762bbb449772b175443575;
        private static var profiler_task_xml:Class = profiler_task_xml$cb275a2c6f71fd972e2d86029684460e691636210;

        private var _disposed:Boolean = false;
        private var _profilerComponent:_SafeStr_1099;
        private var _core:_SafeStr_35;
        private var _window:_SafeStr_3263;
        private var _windowItemArray:Array;
        private var _windowManager:_SafeStr_1694;
        private var _windowRenderer:_SafeStr_3119;
        private var _memoryTracking:Boolean = false;
        private var _windowToTaskMap:_SafeStr_24;

        public function ProfilerOutput(_arg_1:_SafeStr_31, _arg_2:_SafeStr_1694, _arg_3:_SafeStr_3119)
        {
            _core = (_arg_1 as _SafeStr_35);
            _windowItemArray = [];
            _profilerComponent = profiler;
            _windowManager = _arg_2;
            _windowRenderer = _arg_3;
            _windowToTaskMap = new _SafeStr_24();
        }

        private static function padAlign(_arg_1:String, _arg_2:int, _arg_3:String=" ", _arg_4:Boolean=false):String
        {
            var _local_6:int;
            var _local_5:int = (_arg_2 - _arg_1.length);
            if (_local_5 <= 0)
            {
                return (_arg_1.substring(0, _arg_2));
            };
            var _local_7:String = "";
            _local_6 = 0;
            while (_local_6 < _local_5)
            {
                _local_7 = (_local_7 + _arg_3);
                _local_6++;
            };
            return ((_arg_4) ? (_local_7 + _arg_1) : (_arg_1 + _local_7));
        }


        public function get caption():String
        {
            return ("Component Profiler");
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get visible():Boolean
        {
            return ((_window) && (_window.visible));
        }

        public function set visible(_arg_1:Boolean):void
        {
            var value = _arg_1;
            if (((!(_window)) && (value)))
            {
                var bytes:ByteArray = (new profiler_dialog_xml() as ByteArray);
                var xml:XML = new XML(bytes.readUTFBytes(bytes.length));
                _window = (_windowManager.buildFromXML(xml, 2) as _SafeStr_3263);
                _window.procedure = profilerWindowEventProc;
                _window.findChildByName("header").caption = (((((((padAlign("task", 28) + "|") + padAlign("#rounds", 8)) + "|") + padAlign("latest ms", 8)) + "|") + padAlign("total ms", 8)) + "|");
                _window.findChildByName("footer").caption = "<- Click to enable bitmap memory tracking";
                ILabelWindow(_window.findChildByName("footer")).textColor = 4284900966;
            };
            if (_window)
            {
                if (value)
                {
                    _window.activate();
                    _core.setProfilerMode(true);
                    _core.queueInterface(new IIDProfiler(), function (_arg_1:IID, _arg_2:IUnknown):void
                    {
                        profiler = (_arg_2 as _SafeStr_1099);
                    });
                }
                else
                {
                    _core.setProfilerMode(false);
                    _window.dispose();
                    _window = null;
                };
            };
        }

        public function set profiler(_arg_1:_SafeStr_1099):void
        {
            if (_profilerComponent)
            {
                _profilerComponent.removeStopEventListener(refresh);
                _profilerComponent = null;
            };
            if (((!(_profilerComponent)) && (_arg_1)))
            {
                _profilerComponent = _arg_1;
                _profilerComponent.addStopEventListener(refresh);
            };
        }

        public function get profiler():_SafeStr_1099
        {
            return (_profilerComponent);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_window)
                {
                    _window.dispose();
                    _window = null;
                };
                _profilerComponent.removeStopEventListener(refresh);
                _profilerComponent = null;
                _windowManager = null;
                _windowRenderer = null;
                _windowToTaskMap.dispose();
                _windowToTaskMap = null;
                _disposed = true;
            };
        }

        private function profilerWindowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                if (_arg_2.tags.indexOf("close") > -1)
                {
                    visible = false;
                }
                else
                {
                    if (_arg_2.name == "button_gc")
                    {
                        _profilerComponent.gc();
                    };
                };
            };
            if (_arg_2.name == "footer_enable_toggle")
            {
                if (_arg_1.type == "WE_SELECTED")
                {
                    _memoryTracking = true;
                    ILabelWindow(_window.findChildByName("footer")).textColor = 0xFF000000;
                }
                else
                {
                    if (_arg_1.type == "WE_UNSELECTED")
                    {
                        _memoryTracking = false;
                        ILabelWindow(_window.findChildByName("footer")).textColor = 4284900966;
                    };
                };
            };
        }

        public function refresh(_arg_1:Event):void
        {
            if (!_window)
            {
                return;
            };
            _windowToTaskMap.reset();
            var _local_4:Array = _profilerComponent.getProfilerAgentsInArray();
            var _local_3:IItemListWindow = (_window.findChildByName("list") as IItemListWindow);
            var _local_2:uint;
            while (_local_4.length > 0)
            {
                _local_2 = recursiveRedraw(_local_4.pop(), _local_3, _local_2, 0);
            };
            if (_memoryTracking)
            {
                _window.findChildByName("footer").caption = (((((((((((("Assets - Libraries: " + _profilerComponent.numAssetLibraryInstances) + " ") + "Bitmaps: ") + _profilerComponent.numBitmapAssetInstances) + " / ") + _profilerComponent.numAllocatedBitmapDataBytes) + " bytes \n") + "Tracked bitmap data: ") + _profilerComponent.numTrackedBitmapDataInstances) + " / ") + _profilerComponent.numTrackedBitmapDataBytes) + " bytes");
            };
        }

        private function recursiveRedraw(_arg_1:ProfilerAgentTask, _arg_2:IItemListWindow, _arg_3:uint, _arg_4:uint):uint
        {
            var _local_5:* = null;
            var _local_6:* = null;
            var _local_8:uint;
            if (_arg_3 >= _arg_2.numListItems)
            {
                _local_5 = createListItem(_arg_2);
            }
            else
            {
                _local_5 = (_arg_2.getListItemAt(_arg_3) as _SafeStr_3133);
            };
            var _local_7:String = _arg_1.name;
            if (_arg_4 > 0)
            {
                _local_7 = padAlign(_local_7, (_arg_4 + _local_7.length), "-", true);
            };
            var _local_9:_SafeStr_3109 = (_local_5.findChildByName("text") as _SafeStr_3109);
            _local_9.caption = (((((((padAlign(_local_7, 28, " ", false) + "|") + padAlign(_arg_1.rounds, 8, " ", true)) + "|") + padAlign(_arg_1.latest, 8, " ", true)) + "|") + padAlign(_arg_1.total, 8, " ", true)) + "|\r");
            _local_5.findChildByName("caption").caption = _arg_1.caption;
            _local_5.findChildByName("check").setStateFlag(8, (!(_arg_1.paused)));
            _windowToTaskMap.add(_local_5, _arg_1);
            if (!_arg_1.paused)
            {
                _local_6 = (_local_5.findChildByName("canvas") as _SafeStr_3264);
                refreshBitmapImage(_local_6, _arg_1);
            };
            _arg_3++;
            _local_8 = 0;
            while (_local_8 < _arg_1.numSubTasks)
            {
                _arg_3 = recursiveRedraw(_arg_1.getSubTaskAt(_local_8), _arg_2, _arg_3, (_arg_4 + 1));
                _local_8++;
            };
            return (_arg_3);
        }

        private function refreshBitmapImage(_arg_1:_SafeStr_3264, _arg_2:ProfilerAgentTask):void
        {
            var _local_4:BitmapData = _arg_1.bitmap;
            if (_local_4 == null)
            {
                _local_4 = new BitmapData(_arg_1.width, _arg_1.height, false, 0xFFFFFFFF);
                _arg_1.bitmap = _local_4;
            };
            var _local_3:Rectangle = _local_4.rect;
            var _local_6:int = _arg_2.latest;
            var _local_5:int = ((_local_6 > _local_4.height) ? _local_4.height : _local_6);
            _local_3.x = (_local_3.x + 1);
            _local_3.width = (_local_3.width - 1);
            _local_4.copyPixels(_local_4, _local_3, ZERO_POINT);
            _local_3.x = (_local_3.x + (_local_3.width - 2));
            _local_3.y = (_local_3.y + (_local_3.height - _local_5));
            _local_3.width = 1;
            _local_3.height = _local_5;
            _local_4.fillRect(_local_3, ((_local_6 > _local_4.height) ? 0xFFFF0000 : 0xFF0000FF));
            _arg_1.invalidate();
        }

        private function createListItem(_arg_1:IItemListWindow):_SafeStr_3133
        {
            var _local_3:* = null;
            _local_3 = (new profiler_task_xml() as ByteArray);
            var _local_4:XML = new XML(_local_3.readUTFBytes(_local_3.length));
            var _local_2:_SafeStr_3133 = (_windowManager.buildFromXML(_local_4, 2) as _SafeStr_3133);
            _arg_1.addListItem(_local_2);
            var _local_5:_SafeStr_3109 = _local_2.findChildByName("check");
            _local_5.addEventListener("WME_CLICK", onCheckMouseClick);
            return (_local_2);
        }

        private function onCheckMouseClick(_arg_1:_SafeStr_3116):void
        {
            var _local_3:_SafeStr_3109 = _arg_1.window;
            var _local_2:ProfilerAgentTask = _windowToTaskMap.getValue(_local_3.parent);
            if (_local_2)
            {
                _local_2.paused = (!(_local_3.getStateFlag(8)));
            };
        }


    }
}//package com.sulake.core.window.tools

// _SafeStr_1099 = "_-Vm" (String#11834, DoABC#4)
// _SafeStr_1694 = "_-41e" (String#5816, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3119 = "_-y1F" (String#6445, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3155 = "_-32U" (String#19615, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_35 = "_-wP" (String#23060, DoABC#4)


