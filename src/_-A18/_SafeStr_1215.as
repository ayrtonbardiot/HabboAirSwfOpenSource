// by nota

//_-A18._SafeStr_1215

package _-A18
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1215 implements IMessageParser 
    {

        private var _stuffId:int;


        public function get stuffId():int
        {
            return (_stuffId);
        }

        public function flush():Boolean
        {
            _stuffId = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _stuffId = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-A18

// _SafeStr_1215 = "_-O1a" (String#8154, DoABC#3)


