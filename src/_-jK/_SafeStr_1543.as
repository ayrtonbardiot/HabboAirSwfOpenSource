// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-jK._SafeStr_1543

package _-jK
{
    [SecureSWF(rename="true")]
    public class _SafeStr_1543 
    {

        protected var _SafeStr_4222:int;
        protected var _SafeStr_6171:int;
        protected var _songName:String;
        protected var _SafeStr_6172:String;
        private var _SafeStr_7332:Number = 0;

        public function _SafeStr_1543(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String)
        {
            _SafeStr_4222 = _arg_1;
            _SafeStr_6171 = _arg_2;
            _songName = _arg_3;
            _SafeStr_6172 = _arg_4;
        }

        public function get id():int
        {
            return (_SafeStr_4222);
        }

        public function get length():int
        {
            return (_SafeStr_6171);
        }

        public function get name():String
        {
            return (_songName);
        }

        public function get creator():String
        {
            return (_SafeStr_6172);
        }

        public function get startPlayHeadPos():Number
        {
            return (_SafeStr_7332);
        }

        public function set startPlayHeadPos(_arg_1:Number):void
        {
            _SafeStr_7332 = _arg_1;
        }


    }
}//package _-jK

// _SafeStr_1543 = "_-L1G" (String#7939, DoABC#3)
// _SafeStr_4222 = "_-Tb" (String#8526, DoABC#3)
// _SafeStr_6171 = "_-pp" (String#10022, DoABC#3)
// _SafeStr_6172 = "_-21U" (String#6634, DoABC#3)
// _SafeStr_7332 = "_-Dn" (String#7457, DoABC#3)


