// by nota

//_-31H._SafeStr_1375

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1375 implements IMessageParser 
    {

        private var _flatId:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._flatId = _arg_1.readInteger();
            return (true);
        }

        public function get flatId():int
        {
            return (_flatId);
        }


    }
}//package _-31H

// _SafeStr_1375 = "_-sS" (String#10220, DoABC#3)


