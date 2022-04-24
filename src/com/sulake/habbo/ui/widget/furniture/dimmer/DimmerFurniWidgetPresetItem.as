// by nota

//com.sulake.habbo.ui.widget.furniture.dimmer.DimmerFurniWidgetPresetItem

package com.sulake.habbo.ui.widget.furniture.dimmer
{
    public class DimmerFurniWidgetPresetItem 
    {

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4028:int = 0;
        private var _color:uint = 0;
        private var _SafeStr_5116:uint = 0;

        public function DimmerFurniWidgetPresetItem(_arg_1:int, _arg_2:int, _arg_3:uint, _arg_4:uint)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_4028 = _arg_2;
            _color = _arg_3;
            _SafeStr_5116 = _arg_4;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get color():uint
        {
            return (_color);
        }

        public function get light():uint
        {
            return (_SafeStr_5116);
        }

        public function set type(_arg_1:int):void
        {
            _SafeStr_4028 = _arg_1;
        }

        public function set color(_arg_1:uint):void
        {
            _color = _arg_1;
        }

        public function set light(_arg_1:uint):void
        {
            _SafeStr_5116 = _arg_1;
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.dimmer

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_5116 = "_-k6" (String#3444, DoABC#4)


