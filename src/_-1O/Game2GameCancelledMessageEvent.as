// by nota

//_-1O.Game2GameCancelledMessageEvent

package _-1O
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-TY.Game2GameCancelledMessageParser;

    public class Game2GameCancelledMessageEvent extends MessageEvent implements IMessageEvent 
    {

        public function Game2GameCancelledMessageEvent(_arg_1:Function)
        {
            super(_arg_1, Game2GameCancelledMessageParser);
        }

        public function getParser():Game2GameCancelledMessageParser
        {
            return (this._SafeStr_7012 as Game2GameCancelledMessageParser);
        }


    }
}//package _-1O

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


