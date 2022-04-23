// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-QB._SafeStr_1558

package _-QB
{
    import __AS3__.vec.Vector;

    [SecureSWF(rename="true")]
    public class _SafeStr_1558 
    {

        public static const _SafeStr_7506:int = 0;
        public static const _SafeStr_7507:int = 1;
        public static const _SafeStr_7508:int = 2;
        public static const _SafeStr_7509:int = 3;

        private var _SafeStr_4613:int;
        private var _SafeStr_7510:int;
        private var _SafeStr_4794:int;
        private var _SafeStr_7511:int;
        private var _SafeStr_7512:String;
        private var _SafeStr_7513:int;
        private var _SafeStr_7514:int;
        private var _children:Vector.<_SafeStr_1558>;
        private var _SafeStr_7515:Vector.<_SafeStr_1580>;

        public function _SafeStr_1558()
        {
            _children = new Vector.<_SafeStr_1558>();
            _SafeStr_7515 = new Vector.<_SafeStr_1580>();
        }

        public function get questionId():int
        {
            return (_SafeStr_4613);
        }

        public function set questionId(_arg_1:int):void
        {
            _SafeStr_4613 = _arg_1;
        }

        public function get questionType():int
        {
            return (_SafeStr_7510);
        }

        public function set questionType(_arg_1:int):void
        {
            _SafeStr_7510 = _arg_1;
        }

        public function get sortOrder():int
        {
            return (_SafeStr_4794);
        }

        public function set sortOrder(_arg_1:int):void
        {
            _SafeStr_4794 = _arg_1;
        }

        public function get questionText():String
        {
            return (_SafeStr_7512);
        }

        public function set questionText(_arg_1:String):void
        {
            _SafeStr_7512 = _arg_1;
        }

        public function get questionCategory():int
        {
            return (_SafeStr_7511);
        }

        public function set questionCategory(_arg_1:int):void
        {
            _SafeStr_7511 = _arg_1;
        }

        public function get questionAnswerType():int
        {
            return (_SafeStr_7513);
        }

        public function set questionAnswerType(_arg_1:int):void
        {
            _SafeStr_7513 = _arg_1;
        }

        public function get questionAnswerCount():int
        {
            return (_SafeStr_7514);
        }

        public function set questionAnswerCount(_arg_1:int):void
        {
            _SafeStr_7514 = _arg_1;
        }

        public function get children():Vector.<_SafeStr_1558>
        {
            return (_children);
        }

        public function set children(_arg_1:Vector.<_SafeStr_1558>):void
        {
            _children = _arg_1;
        }

        public function get questionChoices():Vector.<_SafeStr_1580>
        {
            return (_SafeStr_7515);
        }

        public function set questionChoices(_arg_1:Vector.<_SafeStr_1580>):void
        {
            _SafeStr_7515 = _arg_1;
        }


    }
}//package _-QB

// _SafeStr_1558 = "_-c14" (String#9104, DoABC#3)
// _SafeStr_1580 = "_-71q" (String#7030, DoABC#3)
// _SafeStr_4613 = "_-SG" (String#8440, DoABC#3)
// _SafeStr_4794 = "_-Wt" (String#8757, DoABC#3)
// _SafeStr_7506 = "_-u1Y" (String#10319, DoABC#3)
// _SafeStr_7507 = "_-N1N" (String#8062, DoABC#3)
// _SafeStr_7508 = "_-Mf" (String#8034, DoABC#3)
// _SafeStr_7509 = "_-s1Q" (String#10185, DoABC#3)
// _SafeStr_7510 = "_-u1M" (String#10313, DoABC#3)
// _SafeStr_7511 = "_-k1A" (String#9662, DoABC#3)
// _SafeStr_7512 = "_-xe" (String#10568, DoABC#3)
// _SafeStr_7513 = "_-V1s" (String#8630, DoABC#3)
// _SafeStr_7514 = "_-i14" (String#9518, DoABC#3)
// _SafeStr_7515 = "_-w1G" (String#10447, DoABC#3)


