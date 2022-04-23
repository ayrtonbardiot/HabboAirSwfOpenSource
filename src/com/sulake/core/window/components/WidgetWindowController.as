// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.components.WidgetWindowController

package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window._SafeStr_1692;
    import com.sulake.core.window._SafeStr_3179;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;

    public class WidgetWindowController extends WindowController implements _SafeStr_3199 
    {

        private var _SafeStr_4672:_SafeStr_1692;
        private var _SafeStr_5034:String = "";
        private var _SafeStr_4981:_SafeStr_3179;

        public function WidgetWindowController(_arg_1:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:_SafeStr_3109, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            _SafeStr_4672 = _arg_5.getWidgetFactory();
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_4981 != null)
                {
                    _SafeStr_4981.dispose();
                    _SafeStr_4981 = null;
                };
                _SafeStr_4672 = null;
                super.dispose();
            };
        }

        override public function get properties():Array
        {
            var _local_1:Array = ((_SafeStr_4981 != null) ? _SafeStr_4981.properties : []);
            _local_1.unshift(createProperty("widget_type", _SafeStr_5034));
            return (super.properties.concat(_local_1));
        }

        override public function set properties(_arg_1:Array):void
        {
            var _local_3:* = null;
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                if (_local_2.key == "widget_type")
                {
                    _local_3 = String(_local_2.value);
                    if (_SafeStr_5034 != _local_3)
                    {
                        if (_SafeStr_4981 != null)
                        {
                            removeChildAt(0);
                            _SafeStr_4981.dispose();
                        };
                        _SafeStr_4981 = _SafeStr_4672.createWidget(_local_2.value, this);
                        _SafeStr_5034 = _local_3;
                    };
                    break;
                };
            };
            if (_SafeStr_4981 != null)
            {
                _SafeStr_4981.properties = _arg_1;
            };
            super.properties = _arg_1;
        }

        override public function set color(_arg_1:uint):void
        {
            super.color = _arg_1;
            var _local_2:Array = [];
            groupChildrenWithTag("_COLORIZE", _local_2, -1);
            for each (var _local_3:_SafeStr_3109 in _local_2)
            {
                _local_3.color = _arg_1;
            };
        }

        public function get iterator():IIterator
        {
            return ((_SafeStr_4981 != null) ? _SafeStr_4981.iterator : EmptyIterator.INSTANCE);
        }

        public function get widget():_SafeStr_3179
        {
            return (_SafeStr_4981);
        }

        public function get rootWindow():_SafeStr_3109
        {
            return (getChildAt(0));
        }

        public function set rootWindow(_arg_1:_SafeStr_3109):void
        {
            removeChildAt(0);
            if (_arg_1 == null)
            {
                return;
            };
            addChild(_arg_1);
            if (_arg_1.tags.indexOf("_EXCLUDE") < 0)
            {
                _arg_1.tags.push("_EXCLUDE");
            };
        }


    }
}//package com.sulake.core.window.components

// _SafeStr_1692 = "_-bT" (String#10055, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3179 = "_-wC" (String#2737, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_4672 = "_-x9" (String#6006, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5034 = "_-k4" (String#8633, DoABC#4)


