// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ol._SafeStr_1614

package _-Ol
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.room.object.data._SafeStr_1613;

    [SecureSWF(rename="true")]
    public class _SafeStr_1614 
    {

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_3734:int = 0;
        private var _SafeStr_3740:IStuffData = new _SafeStr_1613();

        public function _SafeStr_1614(_arg_1:int, _arg_2:int, _arg_3:IStuffData)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_3734 = _arg_2;
            _SafeStr_3740 = _arg_3;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function get data():IStuffData
        {
            return (_SafeStr_3740);
        }


    }
}//package _-Ol

// _SafeStr_1613 = "_-xG" (String#10553, DoABC#3)
// _SafeStr_1614 = "_-sU" (String#10221, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)


