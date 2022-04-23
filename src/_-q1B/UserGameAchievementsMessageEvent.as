// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-q1B.UserGameAchievementsMessageEvent

package _-q1B
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-71X.UserGameAchievementsMessageParser;

    public class UserGameAchievementsMessageEvent extends MessageEvent implements IMessageEvent 
    {

        public function UserGameAchievementsMessageEvent(_arg_1:Function)
        {
            super(_arg_1, UserGameAchievementsMessageParser);
        }

        public function getParser():UserGameAchievementsMessageParser
        {
            return (this._SafeStr_7012 as UserGameAchievementsMessageParser);
        }


    }
}//package _-q1B

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


