// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.components.FrameController

package com.sulake.core.window.components
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.utils.IMargins;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.utils.TextMargins;
    import com.sulake.core.window.iterators.ContainerIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.utils.PropertyStruct;

    public class FrameController extends ContainerController implements _SafeStr_3263 
    {

        private static const TAG_TITLE_ELEMENT:String = "_TITLE";
        private static const TAG_HEADER_ELEMENT:String = "_HEADER";
        private static const TAG_CONTENT_ELEMENT:String = "_CONTENT";
        private static const TAG_SCALER_ELEMENT:String = "_SCALER";

        private var _SafeStr_4004:ILabelWindow;
        private var _header:_SafeStr_3251;
        private var _content:_SafeStr_3133;
        private var _SafeStr_4449:IMargins;
        private var _SafeStr_4211:Boolean = false;
        private var _SafeStr_6110:String = "";
        private var _helpButtonAction:Function = null;

        public function FrameController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            _arg_4 = (_arg_4 | 0x01);
            _arg_4 = (_arg_4 & (~(0x10)));
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _SafeStr_4211 = true;
            activate();
            setupScaling();
            var _local_12:_SafeStr_3109 = findChildByName("header_button_help");
            if (_local_12 != null)
            {
                _local_12.procedure = helpButtonProcedure;
            };
            helpPage = _SafeStr_6110;
        }

        public function get title():ILabelWindow
        {
            return ((_SafeStr_4004) ? _SafeStr_4004 : _SafeStr_4004 = ILabelWindow(findChildByTag("_TITLE")));
        }

        public function get header():_SafeStr_3251
        {
            return ((_header) ? _header : _header = _SafeStr_3251(findChildByTag("_HEADER")));
        }

        public function get content():_SafeStr_3133
        {
            return ((_content) ? _content : _content = _SafeStr_3133(findChildByTag("_CONTENT")));
        }

        public function get scaler():IScalerWindow
        {
            return (findChildByTag("_SCALER") as IScalerWindow);
        }

        public function get margins():IMargins
        {
            if (!_SafeStr_4449)
            {
                _SafeStr_4449 = new TextMargins(content.left, content.top, content.right, content.bottom, marginsCallback);
            };
            return (_SafeStr_4449);
        }

        override public function set caption(_arg_1:String):void
        {
            super.caption = _arg_1;
            try
            {
                title.text = _arg_1;
            }
            catch(e:Error)
            {
            };
        }

        override public function set color(_arg_1:uint):void
        {
            super.color = _arg_1;
            var _local_2:Array = [];
            groupChildrenWithTag("_COLORIZE", _local_2);
            for each (var _local_3:_SafeStr_3109 in _local_2)
            {
                _local_3.color = _arg_1;
            };
        }

        override public function get iterator():IIterator
        {
            return (((!(content == null)) && (_SafeStr_4211)) ? content.iterator : new ContainerIterator(this));
        }

        private function helpButtonProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if ((((_arg_1.type == "WME_CLICK") && (!(_SafeStr_6110 == ""))) && (!(_helpButtonAction == null))))
            {
                (_helpButtonAction(_SafeStr_6110));
            };
        }

        public function set helpButtonAction(_arg_1:Function):void
        {
            _helpButtonAction = _arg_1;
        }

        override public function buildFromXML(_arg_1:XML, _arg_2:_SafeStr_24=null):Boolean
        {
            return (!(context.getWindowParser().parseAndConstruct(_arg_1, content, _arg_2) == null));
        }

        override public function setParamFlag(_arg_1:uint, _arg_2:Boolean=true):void
        {
            super.setParamFlag(_arg_1, _arg_2);
            setupScaling();
        }

        private function setupScaling():void
        {
            var _local_1:_SafeStr_3109 = scaler;
            var _local_2:Boolean = testParamFlag(0x10000);
            var _local_3:Boolean = testParamFlag(0x2000);
            var _local_4:Boolean = testParamFlag(0x1000);
            if (_local_1)
            {
                if (((_local_3) || (_local_2)))
                {
                    _local_1.setParamFlag(0x2000, true);
                }
                else
                {
                    _local_1.setParamFlag(0x2000, false);
                };
                if (((_local_4) || (_local_2)))
                {
                    _local_1.setParamFlag(0x1000, true);
                }
                else
                {
                    _local_1.setParamFlag(0x1000, false);
                };
                _local_1.visible = (((_local_3) || (_local_4)) || (_local_2));
            };
        }

        public function resizeToFitContent():void
        {
            resizeToAccommodateChildren((content as WindowController));
        }

        private function marginsCallback(_arg_1:IMargins):void
        {
            var _local_2:_SafeStr_3109 = content;
            var _local_4:uint = _local_2.param;
            var _local_5:uint = (_local_2.param & (0xC0 | 0x0C00));
            if (_local_5)
            {
                _local_2.setParamFlag((0xC0 | 0x0C00), false);
            };
            var _local_3:uint = (_local_2.param & 0xC00000);
            if (_local_3)
            {
                _local_2.setParamFlag(0xC00000, false);
            };
            _local_2.rectangle = new Rectangle(_arg_1.left, _arg_1.top, (_arg_1.right - _arg_1.left), (_arg_1.bottom - _arg_1.top));
            if (((_local_5) || (_local_3)))
            {
                _local_2.setParamFlag(0xFFFFFFFF, false);
                _local_2.setParamFlag(_local_4, true);
            };
        }

        override public function get properties():Array
        {
            var _local_1:Array = super.properties;
            var _local_2:* = (!(_SafeStr_4449 == null));
            _local_1.push(new PropertyStruct("help_page", _SafeStr_6110, "String", (!(_SafeStr_6110 == ""))));
            _local_1.push(new PropertyStruct("margin_left", content.left, "int", _local_2));
            _local_1.push(new PropertyStruct("margin_top", content.top, "int", _local_2));
            _local_1.push(new PropertyStruct("margin_right", (_SafeStr_4422 - content.right), "int", _local_2));
            _local_1.push(new PropertyStruct("margin_bottom", (_SafeStr_4423 - content.bottom), "int", _local_2));
            return (_local_1);
        }

        override public function set properties(_arg_1:Array):void
        {
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "help_page":
                        helpPage = (_local_2.value as String);
                        break;
                    case "margin_left":
                        margins.left = (_local_2.value as int);
                        break;
                    case "margin_top":
                        margins.top = (_local_2.value as int);
                        break;
                    case "margin_right":
                        margins.right = (_SafeStr_4422 - (_local_2.value as int));
                        break;
                    case "margin_bottom":
                        margins.bottom = (_SafeStr_4423 - (_local_2.value as int));
                };
            };
            super.properties = _arg_1;
        }

        public function get helpPage():String
        {
            return (_SafeStr_6110);
        }

        public function set helpPage(_arg_1:String):void
        {
            _SafeStr_6110 = _arg_1;
            var _local_2:_SafeStr_3109 = findChildByName("header_button_help");
            if (_local_2 != null)
            {
                _local_2.visible = (!(_SafeStr_6110 == ""));
            };
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3251 = "_-xO" (String#5610, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4004 = "_-41o" (String#1978, DoABC#4)
// _SafeStr_4211 = "_-pm" (String#4979, DoABC#4)
// _SafeStr_4422 = "_-a1T" (String#1398, DoABC#4)
// _SafeStr_4423 = "_-Ht" (String#1496, DoABC#4)
// _SafeStr_4449 = "_-A14" (String#1257, DoABC#4)
// _SafeStr_6110 = "_-Q1m" (String#7438, DoABC#4)


