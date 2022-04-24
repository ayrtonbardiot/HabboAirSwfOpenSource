// by nota

//_-31H._SafeStr_1236

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1236 implements IMessageParser 
    {

        private var _userName:String;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _userName = _arg_1.readString();
            return (true);
        }

        public function flush():Boolean
        {
            _userName = null;
            return (true);
        }

        public function get userName():String
        {
            return (_userName);
        }


    }
}//package _-31H

// _SafeStr_1236 = "_-Q1R" (String#8293, DoABC#3)


