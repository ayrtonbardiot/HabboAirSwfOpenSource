// by nota

//com.sulake.habbo.avatar.pets.PetCustomPart

package com.sulake.habbo.avatar.pets
{
    public class PetCustomPart 
    {

        private var _SafeStr_4978:int;
        private var _SafeStr_4977:int;
        private var _SafeStr_4043:int;

        public function PetCustomPart(_arg_1:int, _arg_2:int, _arg_3:int)
        {
            _SafeStr_4978 = _arg_1;
            _SafeStr_4977 = _arg_2;
            _SafeStr_4043 = _arg_3;
        }

        public function get paletteId():int
        {
            return (_SafeStr_4043);
        }

        public function set paletteId(_arg_1:int):void
        {
            _SafeStr_4043 = _arg_1;
        }

        public function get partId():int
        {
            return (_SafeStr_4977);
        }

        public function set partId(_arg_1:int):void
        {
            _SafeStr_4977 = _arg_1;
        }

        public function get layerId():int
        {
            return (_SafeStr_4978);
        }

        public function set layerId(_arg_1:int):void
        {
            _SafeStr_4978 = _arg_1;
        }


    }
}//package com.sulake.habbo.avatar.pets

// _SafeStr_4043 = "_-Ru" (String#7421, DoABC#4)
// _SafeStr_4977 = "_-HD" (String#6848, DoABC#4)
// _SafeStr_4978 = "_-B1j" (String#11854, DoABC#4)


