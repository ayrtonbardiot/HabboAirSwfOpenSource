// by nota

//_-uX._SafeStr_1452

package _-uX
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameStatusData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1452 implements IMessageParser 
    {

        private var _status:GameStatusData;


        public function get status():GameStatusData
        {
            return (_status);
        }

        public function flush():Boolean
        {
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _status = new GameStatusData(_arg_1);
            return (true);
        }


    }
}//package _-uX

// _SafeStr_1452 = "_-O1X" (String#8146, DoABC#3)


