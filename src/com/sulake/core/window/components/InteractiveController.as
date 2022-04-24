// by nota

//com.sulake.core.window.components.InteractiveController

package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.theme.IThemeManager;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.utils.PropertyStruct;

    public class InteractiveController extends WindowController implements IInteractiveWindow 
    {

        protected var _SafeStr_4455:uint;
        protected var _toolTipCaption:String;
        protected var _SafeStr_4459:Boolean;
        protected var _SafeStr_5458:_SafeStr_24;

        public function InteractiveController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            _arg_4 = (_arg_4 | 0x01);
            var _local_12:IThemeManager = _arg_5.getWindowFactory().getThemeManager();
            _SafeStr_4455 = _local_12.getPropertyDefaults(_arg_3).get("tool_tip_delay").value;
            _toolTipCaption = _local_12.getPropertyDefaults(_arg_3).get("tool_tip_caption").value;
            _SafeStr_4459 = _local_12.getPropertyDefaults(_arg_3).get("tool_tip_is_dynamic").value;
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        public static function processInteractiveWindowEvents(_arg_1:IInteractiveWindow, _arg_2:_SafeStr_3116):void
        {
            if (_arg_1.toolTipIsDynamic)
            {
                if (_arg_2.type == "WME_OVER")
                {
                    _arg_1.context.getWindowServices().getToolTipAgentService().begin(_arg_1);
                }
                else
                {
                    if (_arg_2.type == "WME_MOVE")
                    {
                        _arg_1.context.getWindowServices().getToolTipAgentService().updateCaption(_arg_1);
                    }
                    else
                    {
                        if (_arg_2.type == "WME_OUT")
                        {
                            _arg_1.context.getWindowServices().getToolTipAgentService().end(_arg_1);
                        };
                    };
                };
            }
            else
            {
                if (((!(_arg_1.toolTipCaption == null)) && (_arg_1.toolTipCaption.length > 0)))
                {
                    if (_arg_2.type == "WME_OVER")
                    {
                        _arg_1.context.getWindowServices().getToolTipAgentService().begin(_arg_1);
                    }
                    else
                    {
                        if (_arg_2.type == "WME_OUT")
                        {
                            _arg_1.context.getWindowServices().getToolTipAgentService().end(_arg_1);
                        };
                    };
                };
            };
        }

        public static function readInteractiveWindowProperties(_arg_1:IInteractiveWindow, _arg_2:Array):void
        {
            for each (var _local_3:PropertyStruct in _arg_2)
            {
                switch (_local_3.key)
                {
                    case "tool_tip_caption":
                        if (_local_3.value != _arg_1.toolTipCaption)
                        {
                            _arg_1.toolTipCaption = (_local_3.value as String);
                        };
                        break;
                    case "tool_tip_delay":
                        if (_local_3.value != _arg_1.toolTipDelay)
                        {
                            _arg_1.toolTipDelay = (_local_3.value as uint);
                        };
                        break;
                    case "tool_tip_is_dynamic":
                        if (_local_3.value != _arg_1.toolTipIsDynamic)
                        {
                            _arg_1.toolTipIsDynamic = (_local_3.value as Boolean);
                        };
                };
            };
        }

        public static function writeInteractiveWindowProperties(_arg_1:IInteractiveWindow, _arg_2:Array):Array
        {
            _arg_2.push(_arg_1.createProperty("tool_tip_caption", _arg_1.toolTipCaption));
            _arg_2.push(_arg_1.createProperty("tool_tip_delay", _arg_1.toolTipDelay));
            _arg_2.push(_arg_1.createProperty("tool_tip_is_dynamic", _arg_1.toolTipIsDynamic));
            return (_arg_2);
        }


        public function set toolTipCaption(_arg_1:String):void
        {
            _toolTipCaption = ((_arg_1 == null) ? getDefaultProperty("tool_tip_caption").value : _arg_1);
        }

        public function get toolTipCaption():String
        {
            return (_toolTipCaption);
        }

        public function set toolTipDelay(_arg_1:uint):void
        {
            _SafeStr_4455 = _arg_1;
        }

        public function get toolTipDelay():uint
        {
            return (_SafeStr_4455);
        }

        public function setMouseCursorForState(_arg_1:uint, _arg_2:uint):uint
        {
            if (testStateFlag(32))
            {
                return (1);
            };
            if (!_SafeStr_5458)
            {
                _SafeStr_5458 = new _SafeStr_24();
            };
            var _local_3:uint = _SafeStr_5458[_arg_1];
            if (((_arg_2 == 0) || (_arg_2 == -1)))
            {
                _SafeStr_5458.remove(_arg_1);
            }
            else
            {
                _SafeStr_5458[_arg_1] = _arg_2;
            };
            return (_local_3);
        }

        public function getMouseCursorByState(_arg_1:uint):uint
        {
            if (!_SafeStr_5458)
            {
                return (0);
            };
            return (_SafeStr_5458.getValue(_arg_1));
        }

        override public function update(_arg_1:WindowController, _arg_2:_SafeStr_3116):Boolean
        {
            if (_arg_1 == this)
            {
                processInteractiveWindowEvents(this, _arg_2);
            };
            return (super.update(_arg_1, _arg_2));
        }

        public function showToolTip(_arg_1:IToolTipWindow):void
        {
        }

        public function hideToolTip():void
        {
        }

        override public function get properties():Array
        {
            return (writeInteractiveWindowProperties(this, super.properties));
        }

        override public function set properties(_arg_1:Array):void
        {
            readInteractiveWindowProperties(this, _arg_1);
            super.properties = _arg_1;
        }

        public function set toolTipIsDynamic(_arg_1:Boolean):void
        {
            _SafeStr_4459 = _arg_1;
        }

        public function get toolTipIsDynamic():Boolean
        {
            return (_SafeStr_4459);
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_4455 = "_-2h" (String#2981, DoABC#4)
// _SafeStr_4459 = "_-Z1A" (String#3905, DoABC#4)
// _SafeStr_5458 = "_-h1" (String#3042, DoABC#4)


