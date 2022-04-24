// by nota

//_-p1o._SafeStr_1618

package _-p1o
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1618 
    {

        public static const _SafeStr_7480:int = -1;
        public static const _SafeStr_7481:int = 0;
        public static const _SafeStr_7482:int = 1;
        public static const _SafeStr_7483:int = 2;

        private var _SafeStr_6292:int;
        private var _SafeStr_3623:int;
        private var _SafeStr_4615:String;
        private var _SafeStr_6334:int;
        private var _SafeStr_7484:int;
        private var _SafeStr_7219:int;
        private var _SafeStr_7220:int;
        private var _SafeStr_7485:int;
        private var _SafeStr_7486:Boolean;
        private var _SafeStr_4158:String;
        private var _SafeStr_7487:String;
        private var _SafeStr_7488:int;
        private var _SafeStr_7489:int;
        private var _SafeStr_3734:int;

        public function _SafeStr_1618(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_6292 = _arg_1.readInteger();
            _SafeStr_3623 = _arg_1.readInteger();
            _SafeStr_4615 = _arg_1.readString();
            _SafeStr_6334 = _arg_1.readInteger();
            _SafeStr_7484 = Math.max(1, _arg_1.readInteger());
            _SafeStr_7219 = _arg_1.readInteger();
            _SafeStr_7220 = _arg_1.readInteger();
            _SafeStr_7485 = _arg_1.readInteger();
            _SafeStr_7486 = _arg_1.readBoolean();
            _SafeStr_4158 = _arg_1.readString();
            _SafeStr_7487 = _arg_1.readString();
            _SafeStr_7488 = _arg_1.readInteger();
            _SafeStr_7489 = _arg_1.readInteger();
            _SafeStr_3734 = _arg_1.readShort();
        }

        public function get achievementId():int
        {
            return (_SafeStr_6292);
        }

        public function get badgeId():String
        {
            return (_SafeStr_4615);
        }

        public function get level():int
        {
            return (_SafeStr_3623);
        }

        public function get scoreAtStartOfLevel():int
        {
            return (_SafeStr_6334);
        }

        public function get scoreLimit():int
        {
            return (_SafeStr_7484 - _SafeStr_6334);
        }

        public function get levelRewardPoints():int
        {
            return (_SafeStr_7219);
        }

        public function get levelRewardPointType():int
        {
            return (_SafeStr_7220);
        }

        public function get currentPoints():int
        {
            return (_SafeStr_7485 - _SafeStr_6334);
        }

        public function get finalLevel():Boolean
        {
            return (_SafeStr_7486);
        }

        public function get category():String
        {
            return (_SafeStr_4158);
        }

        public function get subCategory():String
        {
            return (_SafeStr_7487);
        }

        public function get levelCount():int
        {
            return (_SafeStr_7488);
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function get firstLevelAchieved():Boolean
        {
            return ((_SafeStr_3623 > 1) || (_SafeStr_7486));
        }

        public function setMaxProgress():void
        {
            _SafeStr_7485 = _SafeStr_7484;
        }

        public function get displayMethod():int
        {
            return (_SafeStr_7489);
        }


    }
}//package _-p1o

// _SafeStr_1618 = "_-N2" (String#8084, DoABC#3)
// _SafeStr_3623 = "_-OF" (String#8175, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_4158 = "_-pH" (String#10006, DoABC#3)
// _SafeStr_4615 = "_-91W" (String#7167, DoABC#3)
// _SafeStr_6292 = "_-Q18" (String#8286, DoABC#3)
// _SafeStr_6334 = "_-of" (String#9958, DoABC#3)
// _SafeStr_7219 = "_-02i" (String#6517, DoABC#3)
// _SafeStr_7220 = "_-uo" (String#10363, DoABC#3)
// _SafeStr_7480 = "_-q9" (String#10073, DoABC#3)
// _SafeStr_7481 = "_-GO" (String#7630, DoABC#3)
// _SafeStr_7482 = "_-f1u" (String#9349, DoABC#3)
// _SafeStr_7483 = "_-g1t" (String#9407, DoABC#3)
// _SafeStr_7484 = "_-P9" (String#8255, DoABC#3)
// _SafeStr_7485 = "_-51q" (String#6897, DoABC#3)
// _SafeStr_7486 = "_-d15" (String#9170, DoABC#3)
// _SafeStr_7487 = "_-hY" (String#9499, DoABC#3)
// _SafeStr_7488 = "_-t1N" (String#10252, DoABC#3)
// _SafeStr_7489 = "_-M1j" (String#8013, DoABC#3)


