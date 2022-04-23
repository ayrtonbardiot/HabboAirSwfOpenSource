// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.phonenumber.PhoneNumberCollectView

package com.sulake.habbo.phonenumber
{
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.ITextFieldWindow;
    import adobe.serialization.json.JSONDecoder;
    import com.sulake.core.window.components._SafeStr_3284;
    import com.sulake.habbo.utils.TextWindowUtils;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.window.utils._SafeStr_3198;
    import com.sulake.core.window.events._SafeStr_3116;

    public class PhoneNumberCollectView 
    {

        private static const ALL_COUNTRY_CODES:Array = ["VU", "EC", "VN", "VI", "DZ", "VG", "VE", "DM", "VC", "DO", "VA", "DE", "UZ", "UY", "DK", "DJ", "US", "UG", "UA", "ET", "ES", "ER", "EH", "EG", "EE", "TZ", "TT", "TW", "TV", "GD", "GE", "GF", "GA", "GB", "FR", "FO", "FK", "FJ", "FM", "FI", "WS", "GY", "GW", "GU", "GT", "GR", "GQ", "WF", "GP", "GN", "GM", "GL", "GI", "GH", "GG", "RE", "RO", "AT", "AS", "AR", "QA", "AW", "AU", "AZ", "BA", "PT", "AC", "AD", "PW", "AG", "AE", "PR", "PS", "AF", "AL", "AI", "AO", "PY", "AM", "BW", "TG", "BY", "TD", "TK", "BS", "TJ", "BR", "BT", "TH", "TO", "TN", "TM", "TL", "CA", "BZ", "TR", "BF", "SV", "BG", "BH", "SS", "BI", "ST", "SY", "BB", "SZ", "BD", "BE", "SX", "BN", "BO", "BQ", "BJ", "TC", "BL", "TA", "BM", "CZ", "SD", "CY", "SC", "CX", "CW", "SE", "SH", "CV", "SG", "CU", "SJ", "SI", "SL", "SK", "SN", "SM", "SO", "SR", "CI", "RS", "CG", "CH", "RU", "RW", "CF", "CC", "CD", "CR", "CO", "CM", "CN", "SA", "CK", "SB", "CL", "LV", "LU", "LT", "LY", "LS", "LR", "MG", "MH", "ME", "MF", "MK", "ML", "MC", "MD", "MA", "MV", "MU", "MX", "MW", "MZ", "MY", "MN", "MM", "MP", "MO", "MR", "MQ", "MT", "MS", "NF", "NG", "NI", "NL", "NA", "NC", "NE", "NZ", "NU", "NR", "NP", "NO", "OM", "PL", "PM", "PH", "PK", "PE", "PF", "PG", "PA", "HK", "ZA", "HN", "HR", "HT", "HU", "ZM", "ZW", "ID", "IE", "IL", "IM", "IN", "IO", "IQ", "IR", "YE", "IS", "IT", "JE", "YT", "JP", "JO", "JM", "KI", "KH", "KG", "KE", "KP", "KR", "KM", "KN", "KW", "KY", "KZ", "LA", "LC", "LB", "LI", "LK"];
        private static const INPUT_MAX_CHARS:int = 30;

        private var _SafeStr_4147:HabboPhoneNumber;
        private var _window:_SafeStr_3263;
        private var _inputTextNeedsClearing:Boolean = true;
        private var _SafeStr_6316:Array;

        public function PhoneNumberCollectView(_arg_1:HabboPhoneNumber, _arg_2:Array)
        {
            _SafeStr_4147 = _arg_1;
            createWindow(_arg_2);
        }

        public function dispose():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_4147 = null;
        }

        public function handleSubmitFailure(_arg_1:int):void
        {
            _window.findChildByName("phone_number_input").caption = "";
            _inputTextNeedsClearing = true;
            setInputStates(true);
        }

        private function createWindow(_arg_1:Array):void
        {
            var _local_5:* = null;
            var _local_9:* = null;
            var _local_7:int;
            var _local_4:* = null;
            if (_window)
            {
                return;
            };
            _window = _SafeStr_3263(_SafeStr_4147.windowManager.buildFromXML(XML(_SafeStr_4147.assets.getAssetByName("phonenumber_collect_xml").content)));
            _window.center();
            _window.findChildByName("never_link").procedure = onInput;
            _window.findChildByName("skip_link").procedure = onInput;
            _window.findChildByName("ok_button").procedure = onInput;
            _window.findChildByName("header_button_close").procedure = onInput;
            _window.findChildByName("phone_number_input").procedure = onInput;
            ITextFieldWindow(_window.findChildByName("phone_number_input")).maxChars = 30;
            var _local_6:String = ((_SafeStr_4147.localizationManager.getLocalization("phone.number.collect.countries")) || ("{}"));
            var _local_3:Object = new JSONDecoder(_local_6, false).getValue();
            var _local_8:Array = ALL_COUNTRY_CODES.concat();
            _SafeStr_6316 = [];
            for each (_local_5 in _local_8)
            {
                _local_9 = _local_3[_local_5];
                if (((!(_local_9 == null)) && (_local_9.length > 0)))
                {
                    _SafeStr_6316.push({
                        "code":_local_5,
                        "name":_local_9
                    });
                };
            };
            _SafeStr_6316.sortOn("name");
            _local_7 = (_arg_1.length - 1);
            while (_local_7 >= 0)
            {
                _local_5 = _arg_1[_local_7];
                if (ALL_COUNTRY_CODES.indexOf(_local_5) != -1)
                {
                    _local_4 = _local_3[_local_5];
                    _SafeStr_6316.unshift({
                        "code":_local_5,
                        "name":_local_4
                    });
                };
                _local_7--;
            };
            var _local_10:_SafeStr_3284 = _SafeStr_3284(_window.findChildByName("country_list"));
            for each (var _local_2:Object in _SafeStr_6316)
            {
                _local_10.addMenuItem(createCountrySelectorMenuItem(_local_2.code, _local_2.name));
            };
            if (_local_10.numMenuItems > 0)
            {
                _local_10.selection = 0;
            };
            TextWindowUtils.setHTMLLinkStyle((_window.findChildByName("collect_summary") as ITextWindow), 3369621, 0xFFFFFF, 4306905);
            _window.findChildByName("ok_button").disable();
            setInputStates(true);
        }

        private function createCountrySelectorMenuItem(_arg_1:String, _arg_2:String):_SafeStr_3109
        {
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_SafeStr_4147.windowManager.buildFromXML(XML(_SafeStr_4147.assets.getAssetByName("phonenumber_country_menu_item_xml").content)));
            _local_3.name = _arg_1;
            _local_3.findChildByName("country_code").caption = _arg_2;
            return (_local_3);
        }

        private function get selectedCountryCode():String
        {
            var _local_2:_SafeStr_3284 = _SafeStr_3284(_window.findChildByName("country_list"));
            if (_local_2.selection == -1)
            {
                return ("NOT_SELECTED");
            };
            var _local_1:Object = _SafeStr_6316[_local_2.selection];
            return ((_local_1 != null) ? _local_1.code : "--");
        }

        private function onNeverAgainConfirmClose(_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
        {
            if (((_arg_2.type == "WE_OK") && (_SafeStr_4147)))
            {
                _SafeStr_4147.setNeverAgain();
            };
            _arg_1.dispose();
        }

        private function setInputStates(_arg_1:Boolean):void
        {
            _window.findChildByName("ok_button").disable();
            if (_arg_1)
            {
                _window.findChildByName("phone_number_input").enable();
                _window.findChildByName("never_link").visible = true;
                _window.findChildByName("skip_link").visible = true;
                _window.findChildByName("header_button_close").enable();
                _window.findChildByName("country_list").enable();
            }
            else
            {
                _window.findChildByName("phone_number_input").disable();
                _window.findChildByName("never_link").visible = false;
                _window.findChildByName("skip_link").visible = false;
                _window.findChildByName("header_button_close").disable();
                _window.findChildByName("country_list").disable();
            };
        }

        private function onInput(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_DOWN")
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                    case "skip_link":
                        _SafeStr_4147.setCollectViewMinimized(true);
                        break;
                    case "never_link":
                        _SafeStr_4147.windowManager.confirm("${phone.number.never.again.confirm.title}", "${phone.number.never.again.confirm.text}", 0, onNeverAgainConfirmClose);
                        break;
                    case "ok_button":
                        _SafeStr_4147.sendTryPhoneNumber(selectedCountryCode, _window.findChildByName("phone_number_input").caption);
                        setInputStates(false);
                        break;
                    case "phone_number_input":
                        if (_inputTextNeedsClearing)
                        {
                            _window.findChildByName("phone_number_input").caption = "";
                            _inputTextNeedsClearing = false;
                        };
                        ITextFieldWindow(_window.findChildByName("phone_number_input")).textColor = 0;
                };
            };
            if (((_arg_1.type == "WKE_KEY_UP") && (_arg_1.target.name == "phone_number_input")))
            {
                if (((!(_window.findChildByName("phone_number_input").caption == null)) && (_window.findChildByName("phone_number_input").caption.length > 0)))
                {
                    _window.findChildByName("ok_button").enable();
                }
                else
                {
                    _window.findChildByName("ok_button").disable();
                };
            };
        }


    }
}//package com.sulake.habbo.phonenumber

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3284 = "_-21F" (String#5819, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_6316 = "_-7v" (String#9233, DoABC#4)


