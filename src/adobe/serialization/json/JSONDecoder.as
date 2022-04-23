// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//adobe.serialization.json.JSONDecoder

package adobe.serialization.json
{
    public class JSONDecoder 
    {

        private var _SafeStr_7901:Boolean;
        private var value:*;
        private var _SafeStr_7900:JSONTokenizer;
        private var token:JSONToken;

        public function JSONDecoder(_arg_1:String, _arg_2:Boolean)
        {
            this._SafeStr_7901 = _arg_2;
            _SafeStr_7900 = new JSONTokenizer(_arg_1, _arg_2);
            nextToken();
            value = parseValue();
            if (((_arg_2) && (!(nextToken() == null))))
            {
                _SafeStr_7900.parseError("Unexpected characters left in input stream");
            };
        }

        public function getValue():*
        {
            return (value);
        }

        final private function nextToken():JSONToken
        {
            return (token = _SafeStr_7900.getNextToken());
        }

        final private function nextValidToken():JSONToken
        {
            token = _SafeStr_7900.getNextToken();
            checkValidToken();
            return (token);
        }

        final private function checkValidToken():void
        {
            if (token == null)
            {
                _SafeStr_7900.parseError("Unexpected end of input");
            };
        }

        final private function parseArray():Array
        {
            var _local_1:Array = [];
            nextValidToken();
            if (token.type == 4)
            {
                return (_local_1);
            };
            if (((!(_SafeStr_7901)) && (token.type == 0)))
            {
                nextValidToken();
                if (token.type == 4)
                {
                    return (_local_1);
                };
                _SafeStr_7900.parseError(("Leading commas are not supported.  Expecting ']' but found " + token.value));
            };
            while (true)
            {
                _local_1.push(parseValue());
                nextValidToken();
                if (token.type == 4)
                {
                    return (_local_1);
                };
                if (token.type == 0)
                {
                    nextToken();
                    if (!_SafeStr_7901)
                    {
                        checkValidToken();
                        if (token.type == 4)
                        {
                            return (_local_1);
                        };
                    };
                }
                else
                {
                    _SafeStr_7900.parseError(("Expecting ] or , but found " + token.value));
                };
            };
            return (null); //dead code
        }

        final private function parseObject():Object
        {
            var _local_1:* = null;
            var _local_2:Object = {};
            nextValidToken();
            if (token.type == 2)
            {
                return (_local_2);
            };
            if (((!(_SafeStr_7901)) && (token.type == 0)))
            {
                nextValidToken();
                if (token.type == 2)
                {
                    return (_local_2);
                };
                _SafeStr_7900.parseError(("Leading commas are not supported.  Expecting '}' but found " + token.value));
            };
            while (true)
            {
                if (token.type == 10)
                {
                    _local_1 = String(token.value);
                    nextValidToken();
                    if (token.type == 6)
                    {
                        nextToken();
                        _local_2[_local_1] = parseValue();
                        nextValidToken();
                        if (token.type == 2)
                        {
                            return (_local_2);
                        };
                        if (token.type == 0)
                        {
                            nextToken();
                            if (!_SafeStr_7901)
                            {
                                checkValidToken();
                                if (token.type == 2)
                                {
                                    return (_local_2);
                                };
                            };
                        }
                        else
                        {
                            _SafeStr_7900.parseError(("Expecting } or , but found " + token.value));
                        };
                    }
                    else
                    {
                        _SafeStr_7900.parseError(("Expecting : but found " + token.value));
                    };
                }
                else
                {
                    _SafeStr_7900.parseError(("Expecting string but found " + token.value));
                };
            };
            return (null); //dead code
        }

        final private function parseValue():Object
        {
            checkValidToken();
            switch (token.type)
            {
                case 1:
                    return (parseObject());
                case 3:
                    return (parseArray());
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                    return (token.value);
                case 12:
                    if (!_SafeStr_7901)
                    {
                        return (token.value);
                    };
                    _SafeStr_7900.parseError(("Unexpected " + token.value));
                default:
                    _SafeStr_7900.parseError(("Unexpected " + token.value));
                    return (null);
            };
        }


    }
}//package adobe.serialization.json

// _SafeStr_7900 = "_-k19" (String#9661, DoABC#3)
// _SafeStr_7901 = "_-5M" (String#6914, DoABC#3)


