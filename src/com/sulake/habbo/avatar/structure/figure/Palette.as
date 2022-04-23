// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.structure.figure.Palette

package com.sulake.habbo.avatar.structure.figure
{
    import flash.utils.Dictionary;

    public class Palette implements _SafeStr_3202 
    {

        private var _SafeStr_3820:int;
        private var _colors:Dictionary;

        public function Palette(_arg_1:XML)
        {
            _SafeStr_3820 = parseInt(_arg_1.@id);
            _colors = new Dictionary();
            append(_arg_1);
        }

        public function append(_arg_1:XML):void
        {
            for each (var _local_2:XML in _arg_1.color)
            {
                _colors[String(_local_2.@id)] = new PartColor(_local_2);
            };
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function getColor(_arg_1:int):IPartColor
        {
            return (_colors[String(_arg_1)]);
        }

        public function get colors():Dictionary
        {
            return (_colors);
        }


    }
}//package com.sulake.habbo.avatar.structure.figure

// _SafeStr_3202 = "_-P1H" (String#6065, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)


