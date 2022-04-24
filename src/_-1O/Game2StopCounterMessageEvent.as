// by nota

//_-1O.Game2StopCounterMessageEvent

package _-1O
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-TY.Game2StopCounterMessageParser;
    import _-TY.Game2InArenaQueueMessageParser;

    public class Game2StopCounterMessageEvent extends MessageEvent implements IMessageEvent 
    {

        public function Game2StopCounterMessageEvent(_arg_1:Function)
        {
            super(_arg_1, Game2StopCounterMessageParser);
        }

        public function getParser():Game2InArenaQueueMessageParser
        {
            return (this._SafeStr_7012 as Game2InArenaQueueMessageParser);
        }


    }
}//package _-1O

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


