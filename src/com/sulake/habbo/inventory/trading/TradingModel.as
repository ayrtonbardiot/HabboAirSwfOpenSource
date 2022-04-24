// by nota

//com.sulake.habbo.inventory.trading.TradingModel

package com.sulake.habbo.inventory.trading
{
    import com.sulake.habbo.inventory.IInventoryModel;
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.inventory.HabboInventory;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.habbo.room.IStuffData;
    import flash.events.Event;
    import com.sulake.habbo.inventory.furni.FurniModel;
    import _-61W._SafeStr_821;
    import com.sulake.habbo.inventory.items.GroupItem;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.room.utils.Vector3d;
    import flash.display.BitmapData;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import _-61W._SafeStr_665;
    import _-61W._SafeStr_302;
    import _-61W._SafeStr_183;
    import _-61W._SafeStr_508;
    import _-61W._SafeStr_501;
    import _-61W._SafeStr_390;
    import _-61W._SafeStr_256;
    import _-61W._SafeStr_339;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-K1C._SafeStr_392;
    import _-K1C._SafeStr_774;
    import __AS3__.vec.Vector;
    import _-K1C._SafeStr_364;
    import _-K1C._SafeStr_632;
    import _-K1C._SafeStr_796;
    import _-K1C._SafeStr_744;
    import _-K1C._SafeStr_485;
    import _-K1C._SafeStr_680;
    import _-K1C._SafeStr_492;

    public class TradingModel implements IInventoryModel, _SafeStr_3140 
    {

        public static const MAX_ITEMS_TO_TRADE:uint = 9;
        public static const TRADING_STATE_READY:uint = 0;
        public static const TRADING_STATE_RUNNING:uint = 1;
        public static const TRADING_STATE_COUNTDOWN:uint = 2;
        public static const TRADING_STATE_CONFIRMING:uint = 3;
        public static const TRADING_STATE_CONFIRMED:uint = 4;
        public static const TRADING_STATE_COMPLETED:uint = 5;
        public static const TRADING_STATE_CANCELLED:uint = 6;

        private var _inventory:HabboInventory;
        private var _SafeStr_3745:IAssetLibrary;
        private var _roomEngine:IRoomEngine;
        private var _communication:IHabboCommunicationManager;
        private var _localization:_SafeStr_18;
        private var _soundManager:_SafeStr_2088;
        private var _SafeStr_5359:TradingView;
        private var _disposed:Boolean = false;
        private var _SafeStr_4016:Boolean = false;
        private var _SafeStr_3734:uint = 0;
        private var _SafeStr_5353:int = -1;
        private var _ownUserName:String = "";
        private var _ownUserItems:_SafeStr_24;
        private var _ownUserNumItems:int = 0;
        private var _SafeStr_5360:int = 0;
        private var _SafeStr_5354:Boolean = false;
        private var _SafeStr_5355:Boolean = false;
        private var _SafeStr_5356:int = -1;
        private var _otherUserName:String = "";
        private var _otherUserItems:_SafeStr_24;
        private var _otherUserNumItems:int = 0;
        private var _SafeStr_5361:int = 0;
        private var _SafeStr_5357:Boolean = false;
        private var _SafeStr_5358:Boolean = false;

        public function TradingModel(_arg_1:HabboInventory, _arg_2:_SafeStr_1695, _arg_3:IHabboCommunicationManager, _arg_4:IAssetLibrary, _arg_5:IRoomEngine, _arg_6:_SafeStr_18, _arg_7:_SafeStr_2088)
        {
            _inventory = _arg_1;
            _communication = _arg_3;
            _SafeStr_3745 = _arg_4;
            _roomEngine = _arg_5;
            _localization = _arg_6;
            _soundManager = _arg_7;
            _SafeStr_5359 = new TradingView(this, _arg_2, _arg_4, _arg_5, _arg_6, _arg_7);
        }

        public static function getGuildFurniType(_arg_1:int, _arg_2:IStuffData):String
        {
            var _local_5:int;
            var _local_4:String = _arg_1.toString();
            var _local_3:StringArrayStuffData = (_arg_2 as StringArrayStuffData);
            if (!_local_3)
            {
                return (_local_4);
            };
            _local_5 = 1;
            while (_local_5 < 5)
            {
                _local_4 = (_local_4 + ("," + _local_3.getValue(_local_5)));
                _local_5++;
            };
            return (_local_4);
        }


        public function get running():Boolean
        {
            return (!(_SafeStr_3734 == 0));
        }

        public function get state():uint
        {
            return (_SafeStr_3734);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get ownUserId():int
        {
            return (_SafeStr_5353);
        }

        public function get ownUserName():String
        {
            return (_ownUserName);
        }

        public function get ownUserItems():_SafeStr_24
        {
            return (_ownUserItems);
        }

        public function get ownUserAccepts():Boolean
        {
            return (_SafeStr_5354);
        }

        public function get ownUserCanTrade():Boolean
        {
            return (_SafeStr_5355);
        }

        public function get otherUserId():int
        {
            return (_SafeStr_5356);
        }

        public function get otherUserName():String
        {
            return (_otherUserName);
        }

        public function get otherUserItems():_SafeStr_24
        {
            return (_otherUserItems);
        }

        public function get otherUserAccepts():Boolean
        {
            return (_SafeStr_5357);
        }

        public function get otherUserCanTrade():Boolean
        {
            return (_SafeStr_5358);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (((_SafeStr_5359) && (!(_SafeStr_5359.disposed))))
                {
                    _SafeStr_5359.dispose();
                    _SafeStr_5359 = null;
                };
                _inventory = null;
                _communication = null;
                _SafeStr_3745 = null;
                _roomEngine = null;
                _localization = null;
                _disposed = true;
            };
        }

        public function startTrading(_arg_1:int, _arg_2:String, _arg_3:Boolean, _arg_4:int, _arg_5:String, _arg_6:Boolean):void
        {
            _SafeStr_5353 = _arg_1;
            _ownUserName = _arg_2;
            _ownUserItems = new _SafeStr_24();
            _SafeStr_5354 = false;
            _SafeStr_5355 = _arg_3;
            _SafeStr_5356 = _arg_4;
            _otherUserName = _arg_5;
            _otherUserItems = new _SafeStr_24();
            _SafeStr_5357 = false;
            _SafeStr_5358 = _arg_6;
            _SafeStr_4016 = true;
            state = 1;
            _SafeStr_5359.setup(_arg_1, _arg_3, _arg_4, _arg_6);
            _SafeStr_5359.updateItemList(_SafeStr_5353);
            _SafeStr_5359.updateItemList(_SafeStr_5356);
            _SafeStr_5359.updateUserInterface();
            _SafeStr_5359.clearItemLists();
            _inventory.toggleInventoryPage("furni");
            _inventory.events.dispatchEvent(new Event("HABBO_INVENTORY_TRACKING_EVENT_TRADING"));
        }

        public function close():void
        {
            if (_SafeStr_4016)
            {
                if (((!(_SafeStr_3734 == 0)) && (!(_SafeStr_3734 == 5))))
                {
                    requestCancelTrading();
                    state = 6;
                };
                state = 0;
                _inventory.toggleInventorySubPage("empty");
                _SafeStr_4016 = false;
            };
            _SafeStr_5359.setMinimized(false);
        }

        public function categorySwitch(_arg_1:String):void
        {
            _SafeStr_5359.setMinimized((!(_arg_1 == "furni")));
            _inventory.updateSubView();
        }

        public function set state(_arg_1:uint):void
        {
            _SafeStr_14.log(((((((("OLD STATE: " + _SafeStr_3734) + " NEW STATE: ") + _arg_1) + " OWN: ") + _SafeStr_5354) + " OTHER: ") + _SafeStr_5357));
            var _local_2:Boolean;
            if (_SafeStr_3734 == _arg_1)
            {
                return;
            };
            switch (_SafeStr_3734)
            {
                case 0:
                    if (((_arg_1 == 1) || (_arg_1 == 5)))
                    {
                        _SafeStr_3734 = _arg_1;
                        _local_2 = true;
                    };
                    break;
                case 1:
                    if (_arg_1 == 2)
                    {
                        _SafeStr_3734 = _arg_1;
                        _local_2 = true;
                        startConfirmCountdown();
                    }
                    else
                    {
                        if (_arg_1 == 6)
                        {
                            _SafeStr_3734 = _arg_1;
                            _SafeStr_5359.setMinimized(false);
                            _local_2 = true;
                        };
                    };
                    break;
                case 2:
                    if (_arg_1 == 3)
                    {
                        _SafeStr_3734 = _arg_1;
                        _local_2 = true;
                    }
                    else
                    {
                        if (_arg_1 == 6)
                        {
                            _SafeStr_3734 = _arg_1;
                            _SafeStr_5359.setMinimized(false);
                            _local_2 = true;
                        }
                        else
                        {
                            if (_arg_1 == 1)
                            {
                                _SafeStr_3734 = _arg_1;
                                _local_2 = true;
                                cancelConfirmCountdown();
                            };
                        };
                    };
                    break;
                case 3:
                    if (_arg_1 == 4)
                    {
                        _SafeStr_3734 = _arg_1;
                        _local_2 = true;
                    }
                    else
                    {
                        if (_arg_1 == 5)
                        {
                            _SafeStr_3734 = _arg_1;
                            _local_2 = true;
                            close();
                        }
                        else
                        {
                            if (_arg_1 == 6)
                            {
                                _SafeStr_3734 = _arg_1;
                                _SafeStr_5359.setMinimized(false);
                                _local_2 = true;
                                close();
                            };
                        };
                    };
                    break;
                case 4:
                    if (_arg_1 == 5)
                    {
                        _SafeStr_3734 = _arg_1;
                        _SafeStr_5359.setMinimized(false);
                        _local_2 = true;
                        close();
                    }
                    else
                    {
                        if (_arg_1 == 6)
                        {
                            _SafeStr_3734 = _arg_1;
                            _SafeStr_5359.setMinimized(false);
                            _local_2 = true;
                            close();
                        };
                    };
                    break;
                case 5:
                    if (_arg_1 == 0)
                    {
                        _SafeStr_3734 = _arg_1;
                        _local_2 = true;
                    };
                    break;
                case 6:
                    if (_arg_1 == 0)
                    {
                        _SafeStr_3734 = _arg_1;
                        _local_2 = true;
                    }
                    else
                    {
                        if (_arg_1 == 1)
                        {
                            _SafeStr_3734 = _arg_1;
                            _local_2 = true;
                        };
                    };
                    break;
                default:
                    throw (new Error((('Unknown trading progress state: "' + _SafeStr_3734) + '"')));
            };
            if (_local_2)
            {
                _SafeStr_5359.updateUserInterface();
            }
            else
            {
                throw (new Error(((("Error assigning trading process status! States does not match: (from) " + _SafeStr_3734) + " (to) ") + _arg_1)));
            };
        }

        public function getFurniInventoryModel():FurniModel
        {
            return (_inventory.furniModel);
        }

        public function getInventory():HabboInventory
        {
            return (_inventory);
        }

        public function updateItemGroupMaps(_arg_1:_SafeStr_821, _arg_2:_SafeStr_24, _arg_3:_SafeStr_24):void
        {
            if (_inventory == null)
            {
                return;
            };
            if (_ownUserItems != null)
            {
                _ownUserItems.dispose();
            };
            if (_otherUserItems != null)
            {
                _otherUserItems.dispose();
            };
            if (_arg_1.firstUserID == _SafeStr_5353)
            {
                _ownUserItems = _arg_2;
                _ownUserNumItems = _arg_1.firstUserNumItems;
                _SafeStr_5360 = _arg_1.firstUserNumCredits;
                _otherUserItems = _arg_3;
                _otherUserNumItems = _arg_1.secondUserNumItems;
                _SafeStr_5361 = _arg_1.secondUserNumCredits;
            }
            else
            {
                _ownUserItems = _arg_3;
                _ownUserNumItems = _arg_1.secondUserNumItems;
                _SafeStr_5360 = _arg_1.secondUserNumCredits;
                _otherUserItems = _arg_2;
                _otherUserNumItems = _arg_1.firstUserNumItems;
                _SafeStr_5361 = _arg_1.firstUserNumCredits;
            };
            _SafeStr_5354 = false;
            _SafeStr_5357 = false;
            _SafeStr_5359.updateItemList(_SafeStr_5353);
            _SafeStr_5359.updateItemList(_SafeStr_5356);
            _SafeStr_5359.updateUserInterface();
            var _local_4:FurniModel = _inventory.furniModel;
            if (_local_4 != null)
            {
                _local_4.updateItemLocks();
            };
        }

        public function getOwnItemIdsInTrade():Array
        {
            var _local_5:* = null;
            var _local_2:* = null;
            var _local_3:int;
            var _local_4:int;
            var _local_1:Array = [];
            if (((_ownUserItems == null) || (_ownUserItems.disposed)))
            {
                return (_local_1);
            };
            _local_3 = 0;
            while (_local_3 < _ownUserItems.length)
            {
                _local_5 = (_ownUserItems.getWithIndex(_local_3) as GroupItem);
                if (_local_5 != null)
                {
                    _local_4 = 0;
                    while (_local_4 < _local_5.getTotalCount())
                    {
                        _local_2 = _local_5.getAt(_local_4);
                        if (_local_2 != null)
                        {
                            _local_1.push(_local_2.ref);
                        };
                        _local_4++;
                    };
                };
                _local_3++;
            };
            return (_local_1);
        }

        public function get ownUserNumItems():int
        {
            return (_ownUserNumItems);
        }

        public function get ownUserNumCredits():int
        {
            return (_SafeStr_5360);
        }

        public function get otherUserNumItems():int
        {
            return (_otherUserNumItems);
        }

        public function get otherUserNumCredits():int
        {
            return (_SafeStr_5361);
        }

        public function getWindowContainer():_SafeStr_3133
        {
            return (_SafeStr_5359.getWindowContainer());
        }

        public function requestInitialization():void
        {
        }

        public function subCategorySwitch(_arg_1:String):void
        {
            if (_SafeStr_4016)
            {
                if (_SafeStr_3734 != 0)
                {
                    requestCancelTrading();
                };
            };
        }

        public function closingInventoryView():void
        {
            if (_SafeStr_4016)
            {
                close();
            };
        }

        public function startConfirmCountdown():void
        {
            _SafeStr_5359.startConfirmCountdown();
        }

        public function cancelConfirmCountdown():void
        {
            _SafeStr_5359.cancelConfirmCountdown();
        }

        public function confirmCountdownReady():void
        {
            if (_SafeStr_3734 == 2)
            {
                state = 3;
            };
        }

        public function getItemImage(_arg_1:FurnitureItem):BitmapData
        {
            var _local_2:* = null;
            if (!_arg_1.isWallItem)
            {
                _local_2 = _roomEngine.getFurnitureImage(_arg_1.type, new Vector3d(180, 0, 0), 64, this, 0, _arg_1.extra, -1, -1, _arg_1.stuffData);
            }
            else
            {
                _local_2 = _roomEngine.getWallItemImage(_arg_1.type, new Vector3d(180, 0, 0), 64, this, 0, _arg_1.stuffData.getLegacyString());
            };
            return (_local_2.data as BitmapData);
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            _SafeStr_5359.updateItemImage(_arg_1, _arg_2);
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        public function handleMessageEvent(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            if ((_arg_1 is _SafeStr_665))
            {
                _SafeStr_14.log("TRADING::TradingOpenFailedEvent");
                if (((_SafeStr_665(_arg_1).getParser().reason == 7) || (_SafeStr_665(_arg_1).getParser().reason == 8)))
                {
                    _SafeStr_5359.alertPopup(2);
                }
                else
                {
                    _SafeStr_5359.alertTradeOpenFailed(_SafeStr_665(_arg_1));
                };
            }
            else
            {
                if ((_arg_1 is _SafeStr_302))
                {
                    _SafeStr_14.log("TRADING::TradingAcceptEvent");
                    if (_SafeStr_302(_arg_1).userID == _SafeStr_5353)
                    {
                        _SafeStr_5354 = (!(_SafeStr_302(_arg_1).userAccepts == 0));
                    }
                    else
                    {
                        _SafeStr_5357 = (!(_SafeStr_302(_arg_1).userAccepts == 0));
                    };
                    _SafeStr_5359.updateUserInterface();
                }
                else
                {
                    if ((_arg_1 is _SafeStr_183))
                    {
                        _SafeStr_14.log("TRADING::TradingConfirmationEvent");
                        state = 2;
                    }
                    else
                    {
                        if ((_arg_1 is _SafeStr_508))
                        {
                            _SafeStr_14.log("TRADING::TradingCompletedEvent");
                            state = 5;
                        }
                        else
                        {
                            if ((_arg_1 is _SafeStr_501))
                            {
                                _SafeStr_14.log("TRADING::TradingCloseEvent");
                                if (!_SafeStr_4016)
                                {
                                    _SafeStr_14.log("Received TradingCloseEvent, but trading already stopped!!!");
                                    return;
                                };
                                _local_2 = (_arg_1 as _SafeStr_501);
                                if (_local_2.getParser().reason == 1)
                                {
                                    if (_inventory.getBoolean("trading.commiterror.enabled"))
                                    {
                                        _SafeStr_5359.windowManager.simpleAlert("${inventory.trading.notification.title}", "${inventory.trading.notification.commiterror.caption}", "${inventory.trading.notification.commiterror.info}");
                                    };
                                }
                                else
                                {
                                    if (_local_2.getParser().userID != _SafeStr_5353)
                                    {
                                        _SafeStr_5359.alertPopup(1);
                                    };
                                };
                                close();
                            }
                            else
                            {
                                if ((_arg_1 is _SafeStr_390))
                                {
                                    _SafeStr_14.log("TRADING::TradingNotOpenEvent");
                                }
                                else
                                {
                                    if ((_arg_1 is _SafeStr_256))
                                    {
                                        _SafeStr_5359.showOtherUserNotification("${inventory.trading.warning.others_account_disabled}");
                                    }
                                    else
                                    {
                                        if ((_arg_1 is _SafeStr_339))
                                        {
                                            _SafeStr_5359.showOwnUserNotification("${inventory.trading.warning.own_account_disabled}");
                                        }
                                        else
                                        {
                                            _SafeStr_14.log(("TRADING/Unknown message event: " + _arg_1));
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        public function requestFurniViewOpen():void
        {
            _inventory.toggleInventoryPage("furni");
        }

        public function requestOpenTrading(_arg_1:int):void
        {
            _communication.connection.send(new _SafeStr_392(_arg_1));
        }

        public function requestAddItemsToTrading(_arg_1:Vector.<int>, _arg_2:Boolean, _arg_3:int, _arg_4:int, _arg_5:Boolean, _arg_6:IStuffData):void
        {
            var _local_8:*;
            if (((!(_arg_5)) && (_arg_1.length > 0)))
            {
                _communication.connection.send(new _SafeStr_774(_arg_1.pop()));
            }
            else
            {
                _local_8 = new Vector.<int>();
                for each (var _local_7:int in _arg_1)
                {
                    if (canAddItemToTrade(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6))
                    {
                        _local_8.push(_local_7);
                    };
                };
                if (_local_8.length > 0)
                {
                    if (_local_8.length == 1)
                    {
                        _communication.connection.send(new _SafeStr_774(_local_8.pop()));
                    }
                    else
                    {
                        _communication.connection.send(new _SafeStr_364(_local_8));
                    };
                };
            };
        }

        public function canAddItemToTrade(_arg_1:Boolean, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:IStuffData):Boolean
        {
            var _local_6:* = null;
            if (_SafeStr_5354)
            {
                return (false);
            };
            if (_ownUserItems == null)
            {
                return (false);
            };
            if (_ownUserItems.length < 9)
            {
                return (true);
            };
            if (!_arg_4)
            {
                return (false);
            };
            _local_6 = String(_arg_2);
            if (_arg_3 == 6)
            {
                _local_6 = ((String(_arg_2) + "poster") + _arg_5.getLegacyString());
            }
            else
            {
                if (_arg_3 == 17)
                {
                    _local_6 = getGuildFurniType(_arg_2, _arg_5);
                }
                else
                {
                    _local_6 = (((_arg_1) ? "I" : "S") + _local_6);
                };
            };
            return (!(_ownUserItems.getValue(_local_6) == null));
        }

        public function requestRemoveItemFromTrading(_arg_1:int):void
        {
            var _local_2:* = null;
            if (_SafeStr_5354)
            {
                return;
            };
            var _local_3:GroupItem = ownUserItems.getWithIndex(_arg_1);
            if (_local_3)
            {
                _local_2 = _local_3.peek();
                if (_local_2)
                {
                    _communication.connection.send(new _SafeStr_632(_local_2.id));
                };
            };
        }

        public function requestAcceptTrading():void
        {
            _communication.connection.send(new _SafeStr_796());
        }

        public function requestUnacceptTrading():void
        {
            _communication.connection.send(new _SafeStr_744());
        }

        public function requestConfirmAcceptTrading():void
        {
            state = 4;
            _communication.connection.send(new _SafeStr_485());
        }

        public function requestConfirmDeclineTrading():void
        {
            _communication.connection.send(new _SafeStr_680());
        }

        public function requestCancelTrading():void
        {
            _communication.connection.send(new _SafeStr_492());
        }

        public function isCreditFurniPresent():Boolean
        {
            return ((_SafeStr_5360 > 0) || (_SafeStr_5361 > 0));
        }

        private function get citizenshipTalentTrackEnabled():Boolean
        {
            return (_inventory.getBoolean("talent.track.citizenship.enabled"));
        }

        public function updateView():void
        {
        }

        public function selectItemById(_arg_1:String):void
        {
            _SafeStr_14.log("NOT SUPPORTED: TRADING VIEW SELECT BY ID");
        }


    }
}//package com.sulake.habbo.inventory.trading

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_183 = "_-z1I" (String#23056, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_256 = "_-Xj" (String#24885, DoABC#4)
// _SafeStr_302 = "_-N6" (String#13809, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3154 = "_-kO" (String#2057, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_339 = "_-s1F" (String#23563, DoABC#4)
// _SafeStr_364 = "_-r1A" (String#30509, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_3745 = "_-4b" (String#920, DoABC#4)
// _SafeStr_390 = "_-sf" (String#23806, DoABC#4)
// _SafeStr_392 = "_-v9" (String#31107, DoABC#4)
// _SafeStr_4016 = "_-z1x" (String#1885, DoABC#4)
// _SafeStr_485 = "_-Z1o" (String#31149, DoABC#4)
// _SafeStr_492 = "_-g9" (String#30513, DoABC#4)
// _SafeStr_501 = "_-n13" (String#15540, DoABC#4)
// _SafeStr_508 = "_-Z12" (String#24937, DoABC#4)
// _SafeStr_5353 = "_-31F" (String#8471, DoABC#4)
// _SafeStr_5354 = "_-rl" (String#6952, DoABC#4)
// _SafeStr_5355 = "_-m9" (String#18208, DoABC#4)
// _SafeStr_5356 = "_-D1V" (String#11589, DoABC#4)
// _SafeStr_5357 = "_-011" (String#7910, DoABC#4)
// _SafeStr_5358 = "_-S1y" (String#21582, DoABC#4)
// _SafeStr_5359 = "_-3b" (String#2469, DoABC#4)
// _SafeStr_5360 = "_-MQ" (String#11396, DoABC#4)
// _SafeStr_5361 = "_-N1K" (String#10389, DoABC#4)
// _SafeStr_632 = "_-x1T" (String#30003, DoABC#4)
// _SafeStr_665 = "_-r12" (String#10679, DoABC#4)
// _SafeStr_680 = "_-sa" (String#29092, DoABC#4)
// _SafeStr_744 = "_-ba" (String#29996, DoABC#4)
// _SafeStr_774 = "_-YS" (String#19320, DoABC#4)
// _SafeStr_796 = "_-t1G" (String#28928, DoABC#4)
// _SafeStr_821 = "_-41v" (String#15339, DoABC#4)


