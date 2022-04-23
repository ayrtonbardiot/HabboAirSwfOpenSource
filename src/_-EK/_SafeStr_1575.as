// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-EK._SafeStr_1575

package _-EK
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1575 
    {

        private var _SafeStr_4028:int;
        private var _SafeStr_3623:int;
        private var _SafeStr_5591:int;
        private var _SafeStr_7219:int;
        private var _SafeStr_7220:int;
        private var _SafeStr_7221:int;
        private var _SafeStr_4615:int;
        private var _SafeStr_4723:String = "";
        private var _SafeStr_7222:String = "";
        private var _SafeStr_7223:int;
        private var _SafeStr_4158:String;
        private var _SafeStr_7224:Boolean;

        public function _SafeStr_1575(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4028 = _arg_1.readInteger();
            _SafeStr_3623 = _arg_1.readInteger();
            _SafeStr_4615 = _arg_1.readInteger();
            _SafeStr_4723 = _arg_1.readString();
            _SafeStr_5591 = _arg_1.readInteger();
            _SafeStr_7219 = _arg_1.readInteger();
            _SafeStr_7220 = _arg_1.readInteger();
            _SafeStr_7221 = _arg_1.readInteger();
            _SafeStr_7223 = _arg_1.readInteger();
            _SafeStr_7222 = _arg_1.readString();
            _SafeStr_4158 = _arg_1.readString();
            _SafeStr_7224 = _arg_1.readBoolean();
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get level():int
        {
            return (_SafeStr_3623);
        }

        public function get points():int
        {
            return (_SafeStr_5591);
        }

        public function get levelRewardPoints():int
        {
            return (_SafeStr_7219);
        }

        public function get levelRewardPointType():int
        {
            return (_SafeStr_7220);
        }

        public function get bonusPoints():int
        {
            return (_SafeStr_7221);
        }

        public function get badgeId():int
        {
            return (_SafeStr_4615);
        }

        public function get badgeCode():String
        {
            return (_SafeStr_4723);
        }

        public function get removedBadgeCode():String
        {
            return (_SafeStr_7222);
        }

        public function get achievementID():int
        {
            return (_SafeStr_7223);
        }

        public function get category():String
        {
            return (_SafeStr_4158);
        }

        public function get showDialogToUser():Boolean
        {
            return (_SafeStr_7224);
        }


    }
}//package _-EK

// _SafeStr_1575 = "_-s1D" (String#10179, DoABC#3)
// _SafeStr_3623 = "_-OF" (String#8175, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_4158 = "_-pH" (String#10006, DoABC#3)
// _SafeStr_4615 = "_-91W" (String#7167, DoABC#3)
// _SafeStr_4723 = "_-41q" (String#6834, DoABC#3)
// _SafeStr_5591 = "_-r1R" (String#10126, DoABC#3)
// _SafeStr_7219 = "_-02i" (String#6517, DoABC#3)
// _SafeStr_7220 = "_-uo" (String#10363, DoABC#3)
// _SafeStr_7221 = "_-2R" (String#6692, DoABC#3)
// _SafeStr_7222 = "_-vW" (String#10418, DoABC#3)
// _SafeStr_7223 = "_-Ei" (String#7517, DoABC#3)
// _SafeStr_7224 = "_-i1g" (String#9536, DoABC#3)


