// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE.SnowWarGameTokensMessageEvent

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G.SnowWarGameTokensMessageParser;

    public class SnowWarGameTokensMessageEvent extends MessageEvent implements IMessageEvent 
    {

        public function SnowWarGameTokensMessageEvent(_arg_1:Function)
        {
            super(_arg_1, SnowWarGameTokensMessageParser);
        }

        public function getParser():SnowWarGameTokensMessageParser
        {
            return (this._SafeStr_7012 as SnowWarGameTokensMessageParser);
        }


    }
}//package _-AE

// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


