// by nota

//_-Ol._SafeStr_1584

package _-Ol
{
    import com.sulake.room.utils.Vector3d;

    [SecureSWF(rename="true")]
    public class _SafeStr_1584 
    {

        public static const _SafeStr_7469:String = "mv";
        public static const _SafeStr_7470:String = "sld";

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_3985:Vector3d;
        private var _SafeStr_4017:Vector3d;
        private var _SafeStr_7471:String;
        private var _SafeStr_7128:Boolean = false;

        public function _SafeStr_1584(_arg_1:int, _arg_2:Vector3d, _arg_3:Vector3d, _arg_4:String=null)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_3985 = _arg_2;
            _SafeStr_4017 = _arg_3;
            _SafeStr_7471 = _arg_4;
        }

        public function setReadOnly():void
        {
            _SafeStr_7128 = true;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get loc():Vector3d
        {
            return (_SafeStr_3985);
        }

        public function set loc(_arg_1:Vector3d):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_3985 = _arg_1;
            };
        }

        public function get target():Vector3d
        {
            return (_SafeStr_4017);
        }

        public function set target(_arg_1:Vector3d):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_4017 = _arg_1;
            };
        }

        public function get moveType():String
        {
            return (_SafeStr_7471);
        }

        public function set moveType(_arg_1:String):void
        {
            if (!_SafeStr_7128)
            {
                _SafeStr_7471 = _arg_1;
            };
        }


    }
}//package _-Ol

// _SafeStr_1584 = "_-a7" (String#9007, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_3985 = "_-Bg" (String#7342, DoABC#3)
// _SafeStr_4017 = "_-eB" (String#9298, DoABC#3)
// _SafeStr_7128 = "_-317" (String#6715, DoABC#3)
// _SafeStr_7469 = "_-VX" (String#8642, DoABC#3)
// _SafeStr_7470 = "_-F1s" (String#7555, DoABC#3)
// _SafeStr_7471 = "_-M1X" (String#8004, DoABC#3)


