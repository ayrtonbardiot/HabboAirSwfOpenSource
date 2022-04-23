// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-21f._SafeStr_1598

package _-21f
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1598 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_5104:String;
        private var _SafeStr_5447:String;
        private var _localization:String;

        public function _SafeStr_1598(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_3820 = _arg_1.readInteger();
            _SafeStr_5104 = _arg_1.readString();
            _SafeStr_5447 = _arg_1.readString();
            _localization = _arg_1.readString();
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get searchCode():String
        {
            return (_SafeStr_5104);
        }

        public function get filter():String
        {
            return (_SafeStr_5447);
        }

        public function get localization():String
        {
            return (_localization);
        }


    }
}//package _-21f

// _SafeStr_1598 = "_-UP" (String#8579, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_5104 = "_-T14" (String#8472, DoABC#3)
// _SafeStr_5447 = "_-62" (String#6979, DoABC#3)


