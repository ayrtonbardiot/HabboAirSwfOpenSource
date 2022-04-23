// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.data.AnimationFrameData

package com.sulake.habbo.room.object.visualization.data
{
    public class AnimationFrameData 
    {

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4050:int = 0;
        private var _SafeStr_4051:int = 0;
        private var _SafeStr_6929:int = 0;
        private var _SafeStr_6930:int = 0;
        private var _SafeStr_6177:int = 1;

        public function AnimationFrameData(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_4050 = _arg_2;
            _SafeStr_4051 = _arg_3;
            _SafeStr_6929 = _arg_4;
            _SafeStr_6930 = _arg_5;
            _SafeStr_6177 = _arg_6;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function hasDirectionalOffsets():Boolean
        {
            return (false);
        }

        public function getX(_arg_1:int):int
        {
            return (_SafeStr_4050);
        }

        public function getY(_arg_1:int):int
        {
            return (_SafeStr_4051);
        }

        public function get x():int
        {
            return (_SafeStr_4050);
        }

        public function get y():int
        {
            return (_SafeStr_4050);
        }

        public function get randomX():int
        {
            return (_SafeStr_6929);
        }

        public function get randomY():int
        {
            return (_SafeStr_6930);
        }

        public function get repeats():int
        {
            return (_SafeStr_6177);
        }


    }
}//package com.sulake.habbo.room.object.visualization.data

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_6177 = "_-228" (String#10802, DoABC#4)
// _SafeStr_6929 = "_-61b" (String#9907, DoABC#4)
// _SafeStr_6930 = "_-1W" (String#8931, DoABC#4)


