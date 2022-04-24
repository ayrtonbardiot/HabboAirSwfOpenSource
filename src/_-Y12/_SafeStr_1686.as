// by nota

//_-Y12._SafeStr_1686

package _-Y12
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1686 
    {

        private var _SafeStr_4838:String;
        private var _localizationKey:String;

        public function _SafeStr_1686(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4838 = _arg_1.readString();
            _localizationKey = _arg_1.readString();
            if (_localizationKey == "")
            {
                _localizationKey = null;
            };
        }

        public function get productCode():String
        {
            return (_SafeStr_4838);
        }

        public function get localizationKey():String
        {
            return (_localizationKey);
        }


    }
}//package _-Y12

// _SafeStr_1686 = "_-Md" (String#8032, DoABC#3)
// _SafeStr_4838 = "_-T1g" (String#8487, DoABC#3)


