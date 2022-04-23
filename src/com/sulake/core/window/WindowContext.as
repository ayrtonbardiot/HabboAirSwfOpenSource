// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.WindowContext

package com.sulake.core.window
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.window.utils.IEventQueue;
    import com.sulake.core.window.utils.IEventProcessor;
    import com.sulake.core.window.graphics._SafeStr_3119;
    import flash.display.Stage;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.core.window.utils.EventProcessorState;
    import com.sulake.core.localization._SafeStr_17;
    import flash.display.DisplayObjectContainer;
    import com.sulake.core.window.services.IInternalWindowServices;
    import com.sulake.core.window.utils._SafeStr_3319;
    import com.sulake.core.assets.IResourceManager;
    import com.sulake.core.window.components._SafeStr_3216;
    import com.sulake.core.window.components.SubstituteParentController;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.core.window.services.ServiceManager;
    import com.sulake.core.window.utils.WindowParser;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.DesktopController;
    import com.sulake.core.window.utils.MouseEventQueue;
    import com.sulake.core.window.utils.MouseEventProcessor;
    import com.sulake.core.window.utils.tablet.TabletEventQueue;
    import com.sulake.core.window.utils.tablet.TabletEventProcessor;
    import com.sulake.core.window.graphics.IGraphicContextHost;
    import flash.display.DisplayObject;
    import com.sulake.core.localization.ILocalizable;
    import flash.events.Event;

    public class WindowContext implements _SafeStr_3160, _SafeStr_13, _SafeStr_41 
    {

        public static const INPUT_MODE_MOUSE:uint = 0;
        public static const INPUT_MODE_TOUCH:uint = 1;
        public static const ERROR_UNKNOWN:int = 0;
        public static const ERROR_INVALID_WINDOW:int = 1;
        public static const ERROR_WINDOW_NOT_FOUND:int = 2;
        public static const ERROR_WINDOW_ALREADY_EXISTS:int = 3;
        public static const ERROR_UNKNOWN_WINDOW_TYPE:int = 4;
        public static const ERROR_DURING_EVENT_HANDLING:int = 5;

        public static var inputEventQueue:IEventQueue;
        private static var inputEventProcessor:IEventProcessor;
        private static var inputModeFlag:uint = 0;
        private static var _SafeStr_4602:_SafeStr_3119;
        private static var stage:Stage;

        public var inputEventTrackers:Vector.<IInputEventTracker>;
        private var _linkEventTrackers:Vector.<ILinkEventTracker>;
        private var _SafeStr_4671:EventProcessorState;
        protected var _localization:_SafeStr_17;
        protected var _rootDisplayObject:DisplayObjectContainer;
        protected var _throwErrors:Boolean = true;
        protected var _lastError:Error;
        protected var _SafeStr_4669:int = -1;
        protected var _SafeStr_4667:IInternalWindowServices;
        protected var _SafeStr_4668:_SafeStr_3319;
        protected var _SafeStr_4670:_SafeStr_1693;
        protected var _SafeStr_4672:_SafeStr_1692;
        protected var _SafeStr_3723:IResourceManager;
        protected var _SafeStr_4665:_SafeStr_3216;
        protected var _SafeStr_4666:SubstituteParentController;
        private var _disposed:Boolean = false;
        private var _SafeStr_5563:Boolean = false;
        private var _rendering:Boolean = false;
        private var _name:String;
        private var _configuration:_SafeStr_19;

        public function WindowContext(_arg_1:String, _arg_2:_SafeStr_3119, _arg_3:_SafeStr_1693, _arg_4:_SafeStr_1692, _arg_5:IResourceManager, _arg_6:_SafeStr_17, _arg_7:_SafeStr_19, _arg_8:DisplayObjectContainer, _arg_9:Rectangle, _arg_10:Vector.<ILinkEventTracker>)
        {
            _name = _arg_1;
            _SafeStr_4602 = _arg_2;
            _localization = _arg_6;
            _configuration = _arg_7;
            _rootDisplayObject = _arg_8;
            _SafeStr_4667 = new ServiceManager(this, _arg_8);
            _SafeStr_4670 = _arg_3;
            _SafeStr_4672 = _arg_4;
            _SafeStr_3723 = _arg_5;
            _SafeStr_4668 = new WindowParser(this);
            inputEventTrackers = new Vector.<IInputEventTracker>(0);
            _linkEventTrackers = _arg_10;
            if (!stage)
            {
                if ((_rootDisplayObject is Stage))
                {
                    stage = (_rootDisplayObject as Stage);
                }
                else
                {
                    if (_rootDisplayObject.stage)
                    {
                        stage = _rootDisplayObject.stage;
                    };
                };
            };
            Classes.init();
            if (_arg_9 == null)
            {
                _arg_9 = new Rectangle(0, 0, 800, 600);
            };
            _SafeStr_4665 = new DesktopController(("_CONTEXT_DESKTOP_" + _name), this, _arg_9);
            _SafeStr_4665.limits.maxWidth = _arg_9.width;
            _SafeStr_4665.limits.maxHeight = _arg_9.height;
            _rootDisplayObject.addChild(_SafeStr_4665.getDisplayObject());
            _rootDisplayObject.doubleClickEnabled = true;
            _rootDisplayObject.addEventListener("resize", stageResizedHandler);
            _SafeStr_4671 = new EventProcessorState(_SafeStr_4602, _SafeStr_4665, _SafeStr_4665, null, inputEventTrackers);
            inputMode = 0;
            _SafeStr_4666 = new SubstituteParentController(this);
        }

        public static function get inputMode():uint
        {
            return (inputModeFlag);
        }

        public static function set inputMode(_arg_1:uint):void
        {
            if (inputEventQueue)
            {
                if ((inputEventQueue is _SafeStr_13))
                {
                    _SafeStr_13(inputEventQueue).dispose();
                };
            };
            if (inputEventProcessor)
            {
                if ((inputEventProcessor is _SafeStr_13))
                {
                    _SafeStr_13(inputEventProcessor).dispose();
                };
            };
            switch (_arg_1)
            {
                case INPUT_MODE_MOUSE:
                    inputEventQueue = new MouseEventQueue(stage);
                    inputEventProcessor = new MouseEventProcessor();
                    try
                    {
                    }
                    catch(e:Error)
                    {
                    };
                    return;
                case 1:
                    inputEventQueue = new TabletEventQueue(stage);
                    inputEventProcessor = new TabletEventProcessor();
                    try
                    {
                    }
                    catch(e:Error)
                    {
                    };
                    return;
                default:
                    inputMode = INPUT_MODE_MOUSE;
                    throw (new Error(("Unknown input mode " + _arg_1)));
            };
        }


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _disposed = true;
                _rootDisplayObject.removeEventListener("resize", stageResizedHandler);
                _rootDisplayObject.removeChild((IGraphicContextHost(_SafeStr_4665).getGraphicContext(true) as DisplayObject));
                _SafeStr_4665.destroy();
                _SafeStr_4665 = null;
                _SafeStr_4666.destroy();
                _SafeStr_4666 = null;
                if ((_SafeStr_4667 is _SafeStr_13))
                {
                    _SafeStr_13(_SafeStr_4667).dispose();
                };
                _SafeStr_4667 = null;
                _SafeStr_4668.dispose();
                _SafeStr_4668 = null;
                _SafeStr_4602 = null;
                _localization = null;
                _rootDisplayObject = null;
                _SafeStr_4670 = null;
                _SafeStr_4672 = null;
                _SafeStr_3723 = null;
            };
        }

        public function getLastError():Error
        {
            return (_lastError);
        }

        public function getLastErrorCode():int
        {
            return (_SafeStr_4669);
        }

        public function handleError(_arg_1:int, _arg_2:Error):void
        {
            _lastError = _arg_2;
            _SafeStr_4669 = _arg_1;
            if (_throwErrors)
            {
                throw (_arg_2);
            };
        }

        public function flushError():void
        {
            _lastError = null;
            _SafeStr_4669 = -1;
        }

        public function getWindowServices():IInternalWindowServices
        {
            return (_SafeStr_4667);
        }

        public function getWindowParser():_SafeStr_3319
        {
            return (_SafeStr_4668);
        }

        public function getWindowFactory():_SafeStr_1693
        {
            return (_SafeStr_4670);
        }

        public function getDesktopWindow():_SafeStr_3216
        {
            return (_SafeStr_4665);
        }

        public function findWindowByName(_arg_1:String):_SafeStr_3109
        {
            return (_SafeStr_4665.findChildByName(_arg_1));
        }

        public function findWindowByTag(_arg_1:String):_SafeStr_3109
        {
            return (_SafeStr_4665.findChildByTag(_arg_1));
        }

        public function groupChildrenWithTag(_arg_1:String, _arg_2:Array, _arg_3:int=0):uint
        {
            return (_SafeStr_4665.groupChildrenWithTag(_arg_1, _arg_2, _arg_3));
        }

        public function registerLocalizationListener(_arg_1:String, _arg_2:_SafeStr_3109):void
        {
            _localization.registerListener(_arg_1, (_arg_2 as ILocalizable));
        }

        public function removeLocalizationListener(_arg_1:String, _arg_2:_SafeStr_3109):void
        {
            _localization.removeListener(_arg_1, (_arg_2 as ILocalizable));
        }

        public function create(_arg_1:String, _arg_2:String, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:Rectangle, _arg_7:Function, _arg_8:_SafeStr_3109, _arg_9:uint, _arg_10:Array=null, _arg_11:String="", _arg_12:Array=null):_SafeStr_3109
        {
            var _local_14:* = null;
            var _local_13:Class = Classes.getWindowClassByType(_arg_3);
            if (_local_13 == null)
            {
                handleError(4, new Error((('Failed to solve implementation for window "' + _arg_1) + '"!')));
                return (null);
            };
            if (_arg_8 == null)
            {
                if ((_arg_5 & 0x10))
                {
                    _arg_8 = _SafeStr_4666;
                };
            };
            _local_14 = new _local_13(_arg_1, _arg_3, _arg_4, _arg_5, this, _arg_6, ((_arg_8 != null) ? _arg_8 : _SafeStr_4665), _arg_7, _arg_10, _arg_12, _arg_9);
            _local_14.dynamicStyle = _arg_11;
            if (((_arg_2) && (_arg_2.length)))
            {
                _local_14.caption = _arg_2;
            };
            return (_local_14);
        }

        public function destroy(_arg_1:_SafeStr_3109):Boolean
        {
            if (_arg_1 == _SafeStr_4665)
            {
                _SafeStr_4665 = null;
            };
            if (_arg_1.state != 0x40000000)
            {
                _arg_1.destroy();
            };
            return (true);
        }

        public function invalidate(_arg_1:_SafeStr_3109, _arg_2:Rectangle, _arg_3:uint):void
        {
            if (!disposed)
            {
                _SafeStr_4602.addToRenderQueue(_arg_1, _arg_2, _arg_3);
            };
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:* = null;
            _SafeStr_5563 = true;
            if (_lastError)
            {
                _local_2 = _lastError;
                _lastError = null;
                throw (_local_2);
            };
            inputEventProcessor.process(_SafeStr_4671, inputEventQueue);
            _SafeStr_5563 = false;
        }

        public function render(_arg_1:uint):void
        {
            _rendering = true;
            _SafeStr_4602.render();
            _rendering = false;
        }

        private function stageResizedHandler(_arg_1:Event):void
        {
            var _local_2:int;
            var _local_3:int;
            if (((!(_SafeStr_4665 == null)) && (!(_SafeStr_4665.disposed))))
            {
                if ((_rootDisplayObject is Stage))
                {
                    _local_2 = Stage(_rootDisplayObject).stageWidth;
                    _local_3 = Stage(_rootDisplayObject).stageHeight;
                }
                else
                {
                    _local_2 = _rootDisplayObject.width;
                    _local_3 = _rootDisplayObject.height;
                };
                if (((_local_2 >= 10) && (_local_3 >= 10)))
                {
                    _SafeStr_4665.limits.maxWidth = _local_2;
                    _SafeStr_4665.limits.maxHeight = _local_3;
                    _SafeStr_4665.width = _local_2;
                    _SafeStr_4665.height = _local_3;
                };
            };
        }

        public function addMouseEventTracker(_arg_1:IInputEventTracker):void
        {
            if (inputEventTrackers.indexOf(_arg_1) < 0)
            {
                inputEventTrackers.push(_arg_1);
            };
        }

        public function removeMouseEventTracker(_arg_1:IInputEventTracker):void
        {
            var _local_2:int = inputEventTrackers.indexOf(_arg_1);
            if (_local_2 > -1)
            {
                inputEventTrackers.splice(_local_2, 1);
            };
        }

        public function getResourceManager():IResourceManager
        {
            return (_SafeStr_3723);
        }

        public function getWidgetFactory():_SafeStr_1692
        {
            return (_SafeStr_4672);
        }

        public function get linkEventTrackers():Vector.<ILinkEventTracker>
        {
            return (_linkEventTrackers);
        }


    }
}//package com.sulake.core.window

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1692 = "_-bT" (String#10055, DoABC#4)
// _SafeStr_1693 = "_-mi" (String#10645, DoABC#4)
// _SafeStr_17 = "_-94" (String#5077, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3119 = "_-y1F" (String#6445, DoABC#4)
// _SafeStr_3160 = "_-dQ" (String#2821, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_3319 = "_-Kx" (String#11293, DoABC#4)
// _SafeStr_3723 = "_-71E" (String#4944, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4602 = "_-61o" (String#2385, DoABC#4)
// _SafeStr_4665 = "_-y1q" (String#2325, DoABC#4)
// _SafeStr_4666 = "_-PP" (String#11211, DoABC#4)
// _SafeStr_4667 = "_-m1t" (String#9562, DoABC#4)
// _SafeStr_4668 = "_-N14" (String#10375, DoABC#4)
// _SafeStr_4669 = "_-R1k" (String#12272, DoABC#4)
// _SafeStr_4670 = "_-J8" (String#13718, DoABC#4)
// _SafeStr_4671 = "_-z0" (String#18556, DoABC#4)
// _SafeStr_4672 = "_-x9" (String#6006, DoABC#4)
// _SafeStr_5563 = "_-01N" (String#3443, DoABC#4)


