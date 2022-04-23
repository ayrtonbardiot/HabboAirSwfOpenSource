// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-TY._SafeStr_1116

package _-TY
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyPlayerData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1116 implements IMessageParser 
    {

        private var _SafeStr_7567:GameLobbyPlayerData;
        private var _SafeStr_7568:Boolean;


        public function flush():Boolean
        {
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7567 = new GameLobbyPlayerData(_arg_1);
            _SafeStr_7568 = _arg_1.readBoolean();
            return (true);
        }

        public function get user():GameLobbyPlayerData
        {
            return (_SafeStr_7567);
        }

        public function get wasTeamSwitched():Boolean
        {
            return (_SafeStr_7568);
        }


    }
}//package _-TY

// _SafeStr_1116 = "_-L5" (String#7961, DoABC#3)
// _SafeStr_7567 = "_-41w" (String#6838, DoABC#3)
// _SafeStr_7568 = "_-Pd" (String#8271, DoABC#3)


