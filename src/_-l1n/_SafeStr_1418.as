// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-l1n._SafeStr_1418

package _-l1n
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1418 implements IMessageParser 
    {

        private var _flatId:int = 0;
        private var _userName:String = null;


        public function get userName():String
        {
            return (_userName);
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function flush():Boolean
        {
            _userName = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _flatId = _arg_1.readInteger();
            _userName = _arg_1.readString();
            return (true);
        }


    }
}//package _-l1n

// _SafeStr_1418 = "_-n19" (String#9854, DoABC#3)


