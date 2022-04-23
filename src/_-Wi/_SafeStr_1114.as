// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Wi._SafeStr_1114

package _-Wi
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1114 implements IMessageParser 
    {

        private var _SafeStr_5321:_SafeStr_1645;


        public function get forumData():_SafeStr_1645
        {
            return (_SafeStr_5321);
        }

        public function flush():Boolean
        {
            _SafeStr_5321 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5321 = _SafeStr_1645.readFromMessage(_arg_1);
            return (true);
        }


    }
}//package _-Wi

// _SafeStr_1114 = "_-V1p" (String#8629, DoABC#3)
// _SafeStr_1645 = "_-oc" (String#9956, DoABC#3)
// _SafeStr_5321 = "_-p1M" (String#9982, DoABC#3)


