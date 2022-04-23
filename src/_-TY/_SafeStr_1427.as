// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-TY._SafeStr_1427

package _-TY
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1427 implements IMessageParser 
    {

        private var _SafeStr_6434:GameLobbyData;


        public function get lobbyData():GameLobbyData
        {
            return (_SafeStr_6434);
        }

        public function flush():Boolean
        {
            _SafeStr_6434 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_6434 = new GameLobbyData(_arg_1);
            return (true);
        }


    }
}//package _-TY

// _SafeStr_1427 = "_-a1R" (String#8973, DoABC#3)
// _SafeStr_6434 = "_-uR" (String#10351, DoABC#3)


