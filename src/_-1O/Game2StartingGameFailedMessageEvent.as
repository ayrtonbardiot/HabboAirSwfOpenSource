// by nota

//_-1O.Game2StartingGameFailedMessageEvent

package _-1O
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-TY.Game2StartingGameFailedMessageParser;

    public class Game2StartingGameFailedMessageEvent extends MessageEvent implements IMessageEvent 
    {

        public function Game2StartingGameFailedMessageEvent(_arg_1:Function)
        {
            super(_arg_1, Game2StartingGameFailedMessageParser);
        }

        public function getParser():Game2StartingGameFailedMessageParser
        {
            return (this._SafeStr_7012 as Game2StartingGameFailedMessageParser);
        }


    }
}//package _-1O

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


