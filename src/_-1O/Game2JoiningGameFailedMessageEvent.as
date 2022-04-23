// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-1O.Game2JoiningGameFailedMessageEvent

package _-1O
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-TY.Game2JoiningGameFailedMessageParser;

    public class Game2JoiningGameFailedMessageEvent extends MessageEvent implements IMessageEvent 
    {

        public function Game2JoiningGameFailedMessageEvent(_arg_1:Function)
        {
            super(_arg_1, Game2JoiningGameFailedMessageParser);
        }

        public function getParser():Game2JoiningGameFailedMessageParser
        {
            return (this._SafeStr_7012 as Game2JoiningGameFailedMessageParser);
        }


    }
}//package _-1O

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


