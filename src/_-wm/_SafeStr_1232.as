// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-wm._SafeStr_1232

package _-wm
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-JS._SafeStr_1649;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1232 implements IMessageParser 
    {

        private var _SafeStr_7743:_SafeStr_1649;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._SafeStr_7743 = new _SafeStr_1649(_arg_1);
            return (true);
        }

        public function get req():_SafeStr_1649
        {
            return (this._SafeStr_7743);
        }


    }
}//package _-wm

// _SafeStr_1232 = "_-G1x" (String#7613, DoABC#3)
// _SafeStr_1649 = "_-v1E" (String#10382, DoABC#3)
// _SafeStr_7743 = "_-31a" (String#6723, DoABC#3)


