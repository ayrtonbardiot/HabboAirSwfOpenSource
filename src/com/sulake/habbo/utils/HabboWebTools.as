// by nota

//com.sulake.habbo.utils.HabboWebTools

package com.sulake.habbo.utils
{
    import flash.external.ExternalInterface;
    import flash.net.URLRequest;
    import flash.net.navigateToURL;

    public class HabboWebTools 
    {

        public static const _SafeStr_9142:String = "advertisement";
        public static const _SafeStr_9143:String = "_self";
        public static const WINDOW_HABBO_MAIN:String = "habboMain";
        public static const OPEN_INTERNAL_LINK_FROM_WEB_CALLBACK:String = "openlink";
        public static const GOTO_ROOM_FROM_WEB_CALLBACK:String = "openroom";
        public static const HABBLET_AVATARS:String = "avatars";
        public static const HABBLET_MINI_MAIL:String = "minimail";
        public static const HABBLET_ROOM_ENTER_AD:String = "roomenterad";
        public static const HABBLET_NEWS:String = "news";

        private static var _SafeStr_9144:Boolean = false;
        private static var _SafeStr_4591:String;


        public static function set isSpaWeb(_arg_1:Boolean):void
        {
            _SafeStr_9144 = _arg_1;
        }

        public static function set baseUrl(_arg_1:String):void
        {
            _SafeStr_4591 = _arg_1;
        }

        public static function logEventLog(_arg_1:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.logEventLog", _arg_1);
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log("External interface not working, failed to log event log.");
            };
        }

        public static function openWebPage(_arg_1:String, _arg_2:String=""):void
        {
            var _local_3:* = null;
            if (((_arg_2 == null) || (_arg_2 == "")))
            {
                _arg_2 = "habboMain";
            };
            if (!_arg_1)
            {
                return;
            };
            if (!ExternalInterface.available)
            {
                if (_arg_1.indexOf("http") == 0)
                {
                    public::navigateToURL(_arg_1, _arg_2);
                }
                else
                {
                    public::navigateToURL(((_SafeStr_4591 + "/") + _arg_1), _arg_2);
                };
            }
            else
            {
                try
                {
                    _local_3 = ExternalInterface.call("function() {return navigator.userAgent;}").toLowerCase();
                    if (_local_3.indexOf("firefox") >= 0)
                    {
                        ExternalInterface.call("window.open", _arg_1, _arg_2);
                    }
                    else
                    {
                        if (_local_3.indexOf("msie") >= 0)
                        {
                            ExternalInterface.call((((("function setWMWindow() {window.open('" + _arg_1) + "', '") + _arg_2) + "');}"));
                        }
                        else
                        {
                            public::navigateToURL(_arg_1, _arg_2);
                        };
                    };
                }
                catch(e:Error)
                {
                    _SafeStr_14.log("External interface not working, failed to open web page.");
                };
            };
        }

        public static function openPage(_arg_1:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.openPage", _arg_1);
                }
                else
                {
                    if (_arg_1.indexOf("http") == 0)
                    {
                        public::navigateToURL(_arg_1, "habboMain");
                    }
                    else
                    {
                        public::navigateToURL(((_SafeStr_4591 + "/") + _arg_1), "habboMain");
                    };
                    _SafeStr_14.log("External interface not available, openPage failed.");
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("Failed to open web page " + _arg_1));
            };
        }

        public static function sendHeartBeat():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.heartBeat");
                };
            }
            catch(e:Error)
            {
            };
        }

        public static function openWebPageAndMinimizeClient(_arg_1:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_SafeStr_9144)
                    {
                        openPage(_arg_1);
                    }
                    else
                    {
                        public::navigateToURL(((_SafeStr_4591 + "/") + _arg_1), "habboMain");
                        ExternalInterface.call("FlashExternalInterface.openWebPageAndMinimizeClient", _arg_1);
                    };
                }
                else
                {
                    public::navigateToURL(((_SafeStr_4591 + "/") + _arg_1), "habboMain");
                    ExternalInterface.call("FlashExternalInterface.openWebPageAndMinimizeClient", _arg_1);
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("Failed to open web page " + _arg_1));
            };
        }

        public static function closeWebPageAndRestoreClient():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.closeWebPageAndRestoreClient");
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log("Failed to close web page and restore client!");
            };
        }

        public static function openWebHabblet(_arg_1:String, _arg_2:String=null):void
        {
            var _local_3:* = null;
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.openHabblet", _arg_1, _arg_2);
                }
                else
                {
                    _local_3 = "";
                    switch (_arg_1)
                    {
                        case "avatars":
                            _local_3 = (_SafeStr_4591 + "/settings/avatars");
                            break;
                        case "news":
                            _local_3 = (_SafeStr_4591 + "/community/category/all/1/");
                            break;
                        default:
                            _SafeStr_14.log(("Unknown habblet: " + _arg_1));
                    };
                    if (_local_3.length > 0)
                    {
                        public::navigateToURL(_local_3, "habboMain");
                    };
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("Failed to open Habblet " + _arg_1));
            };
        }

        public static function closeWebHabblet(_arg_1:String, _arg_2:String=null):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.closeHabblet", _arg_1, _arg_2);
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("Failed to close Habblet " + _arg_1));
            };
        }

        public static function sendDisconnectToWeb(_arg_1:int, _arg_2:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.disconnect", _arg_1, _arg_2);
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log("Failed to close send ");
            };
        }

        public static function showGame(_arg_1:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalGameInterface.showGame", _arg_1);
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("Failed to open game: " + e));
            };
        }

        public static function hideGame():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalGameInterface.hideGame");
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log("Failed to hide game");
            };
        }

        public static function navigateToURL(_arg_1:String, _arg_2:String=null):void
        {
            if (((!(_arg_1)) || (_arg_1.length == 0)))
            {
                _SafeStr_14.log("Can not navigate to empty url");
                return;
            };
            var _local_3:URLRequest = new URLRequest(_arg_1);
            flash.net.navigateToURL(_local_3, _arg_2); //not popped
        }

        public static function openExternalLinkWarning(_arg_1:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.openExternalLink", escape(_arg_1));
                }
                else
                {
                    public::navigateToURL(_arg_1, "habboMain");
                    _SafeStr_14.log(("External interface not available. Could not request to open: " + _arg_1));
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("External interface not working. Could not request to open: " + _arg_1));
            };
        }

        public static function roomVisited(_arg_1:int):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.roomVisited", _arg_1);
                }
                else
                {
                    _SafeStr_14.log("External interface not available. Could not store last room visit.");
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log("External interface not working. Could not store last room visit.");
            };
        }

        public static function openMinimail(_arg_1:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_SafeStr_9144)
                    {
                        ExternalInterface.call("FlashExternalInterface.openMinimail", _arg_1);
                    }
                    else
                    {
                        openWebHabblet("minimail", _arg_1);
                    };
                }
                else
                {
                    openWebHabblet("minimail", _arg_1);
                    _SafeStr_14.log("External interface not available. Could not open minimail.");
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log("External interface not working. Could not open minimail.");
            };
        }

        public static function openNews():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_SafeStr_9144)
                    {
                        ExternalInterface.call("FlashExternalInterface.openNews");
                    }
                    else
                    {
                        openWebHabblet("news");
                    };
                }
                else
                {
                    openWebHabblet("news");
                    _SafeStr_14.log("External interface not available. Could not open news.");
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log("External interface not working. Could not open news.");
            };
        }

        public static function closeNews():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_SafeStr_9144)
                    {
                        ExternalInterface.call("FlashExternalInterface.closeNews");
                    }
                    else
                    {
                        closeWebHabblet("news");
                    };
                }
                else
                {
                    closeWebHabblet("news");
                    _SafeStr_14.log("External interface not available. Could not close news.");
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log("External interface not working. Could not close news.");
            };
        }

        public static function openAvatars():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_SafeStr_9144)
                    {
                        ExternalInterface.call("FlashExternalInterface.openAvatars");
                    }
                    else
                    {
                        openWebHabblet("avatars");
                    };
                }
                else
                {
                    openWebHabblet("avatars");
                    _SafeStr_14.log("External interface not available. Could not open avatars.");
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log("External interface not working. Could not open avatars.");
            };
        }

        public static function openRoomEnterAd():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_SafeStr_9144)
                    {
                        ExternalInterface.call("FlashExternalInterface.openRoomEnterAd");
                    }
                    else
                    {
                        openWebHabblet("roomenterad", "");
                    };
                }
                else
                {
                    openWebHabblet("roomenterad", "");
                    _SafeStr_14.log("External interface not available. Could not open roomenterad.");
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log("External interface not working. Could not open roomenterad.");
            };
        }

        public static function updateFigure(_arg_1:String):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    if (_SafeStr_9144)
                    {
                        ExternalInterface.call("FlashExternalInterface.updateFigure", _arg_1);
                    };
                }
                else
                {
                    _SafeStr_14.log("External interface not available. Could not update figure.");
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log("External interface not working. Could not update figure.");
            };
        }

        public static function logOut():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.logout");
                }
                else
                {
                    _SafeStr_14.log("External interface not available. Could not logout.");
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log("External interface not working. Could not logout.");
            };
        }


    }
}//package com.sulake.habbo.utils

// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_4591 = "_-t1s" (String#10265, DoABC#3)
// _SafeStr_9142 = "_-dO" (String#9237, DoABC#3)
// _SafeStr_9143 = "_-GZ" (String#7635, DoABC#3)
// _SafeStr_9144 = "_-cu" (String#9161, DoABC#3)


