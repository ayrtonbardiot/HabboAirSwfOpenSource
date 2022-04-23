// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-p1o._SafeStr_1617

package _-p1o
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1617 
    {

        public static const _SafeStr_7478:int = 0;

        private var _SafeStr_6292:int;
        private var _SafeStr_3623:int;
        private var _SafeStr_4615:String;
        private var _SafeStr_7479:int;
        private var _SafeStr_3734:int;

        public function _SafeStr_1617(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_6292 = _arg_1.readInteger();
            _SafeStr_3623 = _arg_1.readInteger();
            _SafeStr_4615 = _arg_1.readString();
            _SafeStr_7479 = _arg_1.readInteger();
            _SafeStr_3734 = _arg_1.readInteger();
        }

        public function dispose():void
        {
            _SafeStr_6292 = 0;
            _SafeStr_3623 = 0;
            _SafeStr_4615 = "";
            _SafeStr_7479 = 0;
        }

        public function get achievementId():int
        {
            return (_SafeStr_6292);
        }

        public function get level():int
        {
            return (_SafeStr_3623);
        }

        public function get badgeId():String
        {
            return (_SafeStr_4615);
        }

        public function get requiredLevel():int
        {
            return (_SafeStr_7479);
        }

        public function get enabled():Boolean
        {
            return (_SafeStr_3734 == 0);
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }


    }
}//package _-p1o

// _SafeStr_1617 = "_-Gi" (String#7640, DoABC#3)
// _SafeStr_3623 = "_-OF" (String#8175, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_4615 = "_-91W" (String#7167, DoABC#3)
// _SafeStr_6292 = "_-Q18" (String#8286, DoABC#3)
// _SafeStr_7478 = "_-BC" (String#7327, DoABC#3)
// _SafeStr_7479 = "_-V12" (String#8601, DoABC#3)


