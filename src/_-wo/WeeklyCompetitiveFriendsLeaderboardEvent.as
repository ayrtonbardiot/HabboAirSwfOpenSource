// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-wo.WeeklyCompetitiveFriendsLeaderboardEvent

package _-wo
{
    import com.sulake.core.communication.messages.MessageEvent;
    import _-d1Q.Game2WeeklyLeaderboardParser;

    public class WeeklyCompetitiveFriendsLeaderboardEvent extends MessageEvent 
    {

        public function WeeklyCompetitiveFriendsLeaderboardEvent(_arg_1:Function)
        {
            super(_arg_1, Game2WeeklyLeaderboardParser);
        }

        public function getParser():Game2WeeklyLeaderboardParser
        {
            return (this._SafeStr_7012 as Game2WeeklyLeaderboardParser);
        }


    }
}//package _-wo

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


