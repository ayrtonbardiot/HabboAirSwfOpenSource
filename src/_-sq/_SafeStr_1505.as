// by nota

//_-sq._SafeStr_1505

package _-sq
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1505 implements IMessageParser 
    {

        private var _SafeStr_4136:Game2PlayerData;


        public function flush():Boolean
        {
            if (_SafeStr_4136)
            {
                _SafeStr_4136.dispose();
                _SafeStr_4136 = null;
            };
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4136 = new Game2PlayerData();
            _SafeStr_4136.parse(_arg_1);
            return (true);
        }

        public function get player():Game2PlayerData
        {
            return (_SafeStr_4136);
        }


    }
}//package _-sq

// _SafeStr_1505 = "_-a19" (String#8961, DoABC#3)
// _SafeStr_4136 = "_-w1a" (String#10457, DoABC#3)


