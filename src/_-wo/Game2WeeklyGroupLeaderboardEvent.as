// by nota

//_-wo.Game2WeeklyGroupLeaderboardEvent

package _-wo
{
    import com.sulake.core.communication.messages.MessageEvent;
    import _-d1Q.Game2WeeklyGroupLeaderboardParser;

    public class Game2WeeklyGroupLeaderboardEvent extends MessageEvent 
    {

        public function Game2WeeklyGroupLeaderboardEvent(_arg_1:Function)
        {
            super(_arg_1, Game2WeeklyGroupLeaderboardParser);
        }

        public function getParser():Game2WeeklyGroupLeaderboardParser
        {
            return (this._SafeStr_7012 as Game2WeeklyGroupLeaderboardParser);
        }


    }
}//package _-wo

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


