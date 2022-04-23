// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-f1y._SafeStr_1585

package _-f1y
{
    [SecureSWF(rename="true")]
    public class _SafeStr_1585 
    {

        private var _SafeStr_4404:String;
        private var _SafeStr_7227:Boolean = false;
        private var _SafeStr_7228:String = "";


        public function get code():String
        {
            return (_SafeStr_4404);
        }

        public function set code(_arg_1:String):void
        {
            _SafeStr_4404 = _arg_1;
        }

        public function get isAllowed():Boolean
        {
            return (_SafeStr_7227);
        }

        public function set isAllowed(_arg_1:Boolean):void
        {
            _SafeStr_7227 = _arg_1;
        }

        public function get errorMessage():String
        {
            return (_SafeStr_7228);
        }

        public function set errorMessage(_arg_1:String):void
        {
            _SafeStr_7228 = _arg_1;
        }


    }
}//package _-f1y

// _SafeStr_1585 = "_-xW" (String#10563, DoABC#3)
// _SafeStr_4404 = "_-S1r" (String#8423, DoABC#3)
// _SafeStr_7227 = "_-U15" (String#8542, DoABC#3)
// _SafeStr_7228 = "_-HV" (String#7701, DoABC#3)


