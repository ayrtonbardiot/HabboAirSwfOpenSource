// by nota

//com.sulake.habbo.avatar.structure.figure.PartColor

package com.sulake.habbo.avatar.structure.figure
{
    import flash.geom.ColorTransform;

    public class PartColor implements IPartColor 
    {

        private var _SafeStr_3820:int;
        private var _index:int;
        private var _SafeStr_3827:int;
        private var _SafeStr_6910:Boolean = false;
        private var _SafeStr_6640:uint;
        private var _r:uint;
        private var _g:uint;
        private var _b:uint;
        private var _SafeStr_6641:Number;
        private var _SafeStr_6642:Number;
        private var _SafeStr_6643:Number;
        private var _SafeStr_5882:ColorTransform;

        public function PartColor(_arg_1:XML)
        {
            _SafeStr_3820 = parseInt(_arg_1.@id);
            _index = parseInt(_arg_1.@index);
            _SafeStr_3827 = parseInt(_arg_1.@club);
            _SafeStr_6910 = parseInt(_arg_1.@selectable);
            var _local_2:String = _arg_1.text();
            _SafeStr_6640 = parseInt(_local_2, 16);
            _r = ((_SafeStr_6640 >> 16) & 0xFF);
            _g = ((_SafeStr_6640 >> 8) & 0xFF);
            _b = ((_SafeStr_6640 >> 0) & 0xFF);
            _SafeStr_6641 = ((_r / 0xFF) * 1);
            _SafeStr_6642 = ((_g / 0xFF) * 1);
            _SafeStr_6643 = ((_b / 0xFF) * 1);
            _SafeStr_5882 = new ColorTransform(_SafeStr_6641, _SafeStr_6642, _SafeStr_6643);
        }

        public function get colorTransform():ColorTransform
        {
            return (_SafeStr_5882);
        }

        public function get redMultiplier():Number
        {
            return (_SafeStr_6641);
        }

        public function get greenMultiplier():Number
        {
            return (_SafeStr_6642);
        }

        public function get blueMultiplier():Number
        {
            return (_SafeStr_6643);
        }

        public function get rgb():uint
        {
            return (_SafeStr_6640);
        }

        public function get r():uint
        {
            return (_r);
        }

        public function get g():uint
        {
            return (_g);
        }

        public function get b():uint
        {
            return (_b);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get index():int
        {
            return (_index);
        }

        public function get clubLevel():int
        {
            return (_SafeStr_3827);
        }

        public function get isSelectable():Boolean
        {
            return (_SafeStr_6910);
        }


    }
}//package com.sulake.habbo.avatar.structure.figure

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_3827 = "_-81k" (String#3560, DoABC#4)
// _SafeStr_5882 = "_-s5" (String#1584, DoABC#4)
// _SafeStr_6640 = "_-71P" (String#5835, DoABC#4)
// _SafeStr_6641 = "_-xY" (String#8743, DoABC#4)
// _SafeStr_6642 = "_-p1G" (String#8513, DoABC#4)
// _SafeStr_6643 = "_-QL" (String#7942, DoABC#4)
// _SafeStr_6910 = "_-I19" (String#10073, DoABC#4)


