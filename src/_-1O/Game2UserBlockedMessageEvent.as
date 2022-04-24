// by nota

//_-1O.Game2UserBlockedMessageEvent

package _-1O
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-TY.Game2UserBlockedMessageParser;

    public class Game2UserBlockedMessageEvent extends MessageEvent implements IMessageEvent 
    {

        public function Game2UserBlockedMessageEvent(_arg_1:Function)
        {
            super(_arg_1, Game2UserBlockedMessageParser);
        }

        public function getParser():Game2UserBlockedMessageParser
        {
            return (this._SafeStr_7012 as Game2UserBlockedMessageParser);
        }


    }
}//package _-1O

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


