// by nota

//_-n1H._SafeStr_1626

package _-n1H
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1626 
    {

        public static const _SafeStr_7416:int = 0;
        public static const _SafeStr_7417:int = 1;
        public static const _SafeStr_7418:int = 0;
        public static const _SafeStr_7419:int = 1;
        public static const _SafeStr_7420:int = 2;
        public static const _SafeStr_7421:int = 0;
        public static const _SafeStr_7422:int = 1;
        public static const _SafeStr_7423:int = 2;
        public static const _SafeStr_7424:int = 0;
        public static const _SafeStr_7425:int = 1;
        public static const _SafeStr_7426:int = 2;

        private var _SafeStr_3771:int = 0;
        private var _SafeStr_7427:int = 1;
        private var _SafeStr_7428:int = 1;
        private var _SafeStr_7429:int = 1;
        private var _SafeStr_7430:int = 14;

        public function _SafeStr_1626(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_3771 = _arg_1.readInteger();
            _SafeStr_7427 = _arg_1.readInteger();
            _SafeStr_7428 = _arg_1.readInteger();
            _SafeStr_7430 = _arg_1.readInteger();
            _SafeStr_7429 = _arg_1.readInteger();
        }

        public function get mode():int
        {
            return (_SafeStr_3771);
        }

        public function get bubbleWidth():int
        {
            return (_SafeStr_7427);
        }

        public function get scrollSpeed():int
        {
            return (_SafeStr_7428);
        }

        public function get fullHearRange():int
        {
            return (_SafeStr_7430);
        }

        public function get floodSensitivity():int
        {
            return (_SafeStr_7429);
        }


    }
}//package _-n1H

// _SafeStr_1626 = "_-51" (String#6869, DoABC#3)
// _SafeStr_3771 = "_-9Y" (String#7196, DoABC#3)
// _SafeStr_7416 = "_-B1h" (String#7316, DoABC#3)
// _SafeStr_7417 = "_-A6" (String#7240, DoABC#3)
// _SafeStr_7418 = "_-Wh" (String#8750, DoABC#3)
// _SafeStr_7419 = "_-02g" (String#6516, DoABC#3)
// _SafeStr_7420 = "_-5e" (String#6922, DoABC#3)
// _SafeStr_7421 = "_-ne" (String#9911, DoABC#3)
// _SafeStr_7422 = "_-Bq" (String#7347, DoABC#3)
// _SafeStr_7423 = "_-f14" (String#9322, DoABC#3)
// _SafeStr_7424 = "_-W1l" (String#8722, DoABC#3)
// _SafeStr_7425 = "_-PH" (String#8260, DoABC#3)
// _SafeStr_7426 = "_-zU" (String#10694, DoABC#3)
// _SafeStr_7427 = "_-OP" (String#8178, DoABC#3)
// _SafeStr_7428 = "_-YA" (String#8862, DoABC#3)
// _SafeStr_7429 = "_-P1O" (String#8236, DoABC#3)
// _SafeStr_7430 = "_-E18" (String#7464, DoABC#3)


