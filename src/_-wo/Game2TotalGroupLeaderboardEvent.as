// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-wo.Game2TotalGroupLeaderboardEvent

package _-wo
{
    import com.sulake.core.communication.messages.MessageEvent;
    import _-d1Q.Game2GroupLeaderboardParser;

    public class Game2TotalGroupLeaderboardEvent extends MessageEvent 
    {

        public function Game2TotalGroupLeaderboardEvent(_arg_1:Function)
        {
            super(_arg_1, Game2GroupLeaderboardParser);
        }

        public function getParser():Game2GroupLeaderboardParser
        {
            return (this._SafeStr_7012 as Game2GroupLeaderboardParser);
        }


    }
}//package _-wo

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


