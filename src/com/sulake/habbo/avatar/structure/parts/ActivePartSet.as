// by nota

//com.sulake.habbo.avatar.structure.parts.ActivePartSet

package com.sulake.habbo.avatar.structure.parts
{
    public class ActivePartSet 
    {

        private var _SafeStr_3820:String;
        private var _SafeStr_4463:Array;

        public function ActivePartSet(_arg_1:XML)
        {
            _SafeStr_3820 = String(_arg_1.@id);
            _SafeStr_4463 = [];
            for each (var _local_2:XML in _arg_1.activePart)
            {
                _SafeStr_4463.push(String(_local_2.@["set-type"]));
            };
        }

        public function get parts():Array
        {
            return (_SafeStr_4463);
        }


    }
}//package com.sulake.habbo.avatar.structure.parts

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4463 = "_-n1k" (String#1592, DoABC#4)


