// by nota

//_-91q._SafeStr_1390

package _-91q
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1390 implements IMessageParser 
    {

        private var _SafeStr_7132:Boolean;


        public function get canShowInterstitial():Boolean
        {
            return (_SafeStr_7132);
        }

        public function flush():Boolean
        {
            _SafeStr_7132 = false;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7132 = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-91q

// _SafeStr_1390 = "_-5T" (String#6918, DoABC#3)
// _SafeStr_7132 = "_-j1W" (String#9602, DoABC#3)


