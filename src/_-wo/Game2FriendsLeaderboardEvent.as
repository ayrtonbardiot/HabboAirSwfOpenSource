﻿// by nota

//_-wo.Game2FriendsLeaderboardEvent

package _-wo
{
    import com.sulake.core.communication.messages.MessageEvent;
    import _-d1Q.Game2LeaderboardParser;

    public class Game2FriendsLeaderboardEvent extends MessageEvent 
    {

        public function Game2FriendsLeaderboardEvent(_arg_1:Function)
        {
            super(_arg_1, Game2LeaderboardParser);
        }

        public function getParser():Game2LeaderboardParser
        {
            return (this._SafeStr_7012 as Game2LeaderboardParser);
        }


    }
}//package _-wo

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


