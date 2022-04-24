// by nota

//_-TY._SafeStr_1187

package _-TY
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1187 implements IMessageParser 
    {

        private var _SafeStr_7569:GameLobbyData;


        public function flush():Boolean
        {
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7569 = new GameLobbyData(_arg_1);
            return (true);
        }

        public function get gameLobbyData():GameLobbyData
        {
            return (_SafeStr_7569);
        }


    }
}//package _-TY

// _SafeStr_1187 = "_-gk" (String#9435, DoABC#3)
// _SafeStr_7569 = "_-H1x" (String#7685, DoABC#3)


