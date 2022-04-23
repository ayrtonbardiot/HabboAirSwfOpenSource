// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.structure.figure.FigurePart

package com.sulake.habbo.avatar.structure.figure
{
    public class FigurePart implements _SafeStr_3353 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_4028:String;
        private var _SafeStr_5255:int = -1;
        private var _SafeStr_6323:int;
        private var _index:int;
        private var _SafeStr_5947:int = -1;

        public function FigurePart(_arg_1:XML)
        {
            _SafeStr_3820 = parseInt(_arg_1.@id);
            _SafeStr_4028 = String(_arg_1.@type);
            _index = parseInt(_arg_1.@index);
            _SafeStr_6323 = parseInt(_arg_1.@colorindex);
            var _local_2:String = _arg_1.@palettemapid;
            if (_local_2 != "")
            {
                _SafeStr_5947 = _local_2;
            };
            var _local_3:String = _arg_1.@breed;
            if (_local_3 != "")
            {
                _SafeStr_5255 = _local_3;
            };
        }

        public function dispose():void
        {
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get breed():int
        {
            return (_SafeStr_5255);
        }

        public function get colorLayerIndex():int
        {
            return (_SafeStr_6323);
        }

        public function get index():int
        {
            return (_index);
        }

        public function get paletteMap():int
        {
            return (_SafeStr_5947);
        }


    }
}//package com.sulake.habbo.avatar.structure.figure

// _SafeStr_3353 = "_-Ye" (String#6452, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_5255 = "_-C" (String#9448, DoABC#4)
// _SafeStr_5947 = "_-rA" (String#9819, DoABC#4)
// _SafeStr_6323 = "_-N7" (String#18880, DoABC#4)


