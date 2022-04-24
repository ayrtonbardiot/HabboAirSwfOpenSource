// by nota

//com.sulake.habbo.navigator.mainview.OfficialRoomEntryManager

package com.sulake.habbo.navigator.mainview
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.navigator._SafeStr_1697;
    import com.sulake.habbo.navigator.UserCountRenderer;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.navigator.Util;
    import _-Ja._SafeStr_1549;
    import com.sulake.core.window.components.ITextWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;

    public class OfficialRoomEntryManager implements _SafeStr_13 
    {

        private static const HOTTEST_GROUPS_TAG:String = "hottest_groups";
        private static const IMAGE_WIDTH_WIDE:int = 267;
        private static const IMAGE_WIDTH_NARROW:int = 65;
        private static const NARROW_IMAGE_OFFSET:int = -70;

        private var _disposed:Boolean;
        private var _navigator:_SafeStr_1697;
        private var _SafeStr_5195:UserCountRenderer;

        public function OfficialRoomEntryManager(_arg_1:_SafeStr_1697):void
        {
            _navigator = _arg_1;
            _SafeStr_5195 = new UserCountRenderer(_navigator);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (_SafeStr_5195)
            {
                _SafeStr_5195.dispose();
                _SafeStr_5195 = null;
            };
            _disposed = true;
        }

        public function refreshAdFooter(_arg_1:_SafeStr_3133):void
        {
            if (_navigator.data.adRoom == null)
            {
                return;
            };
            var _local_4:String = "ad_footer";
            var _local_5:_SafeStr_3133 = _SafeStr_3133(_arg_1.getChildByName("ad_footer"));
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_local_5.getChildByName("ad_cont"));
            if (_local_2.numChildren < 1)
            {
                _local_2.addChild(createEntry(true));
            };
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_local_2.getChildAt(0));
            refreshEntry(_local_3, true, _navigator.data.adRoom);
            _local_5.visible = true;
            _navigator.data.adIndex++;
        }

        public function createEntry(_arg_1:Boolean):_SafeStr_3133
        {
            var _local_3:* = null;
            var _local_4:_SafeStr_3133 = _SafeStr_3133(_navigator.getXmlWindow("grs_official_room_row_phase_one"));
            var _local_5:_SafeStr_3133 = _SafeStr_3133(_local_4.findChildByName("image_cont"));
            var _local_2:String = ((_arg_1) ? "" : "_b");
            _navigator.refreshButton(_local_5, ("rico_rnd_l" + _local_2), true, null, 0);
            _navigator.refreshButton(_local_5, ("rico_rnd_r" + _local_2), true, null, 0);
            _local_3 = (_local_5.findChildByName("rico_rnd_m") as _SafeStr_3264);
            _local_3.bitmap = _navigator.getButtonImage("rico_rnd_m");
            _local_3.disposesBitmap = false;
            var _local_6:_SafeStr_3133 = _SafeStr_3133(_local_4.findChildByName("folder_cont"));
            _navigator.refreshButton(_local_6, ("rico_rnd_l" + _local_2), true, null, 0);
            _navigator.refreshButton(_local_6, ("rico_rnd_r" + _local_2), true, null, 0);
            _local_3 = (_local_6.findChildByName("rico_rnd_m") as _SafeStr_3264);
            _local_3.bitmap = _navigator.getButtonImage("rico_rnd_m");
            _local_3.disposesBitmap = false;
            _local_4.addEventListener("WME_OVER", onCellMouseOver);
            _local_4.addEventListener("WME_OUT", onCellMouseOut);
            _local_4.addEventListener("WME_CLICK", onCellMouseClick);
            _local_4.color = ((_arg_1) ? 0xFFFFFFFF : 4292797682);
            return (_local_4);
        }

        public function refreshEntry(_arg_1:_SafeStr_3133, _arg_2:Boolean, _arg_3:_SafeStr_1549):void
        {
            Util.hideChildren(_arg_1);
            if (_arg_2)
            {
                _arg_1.id = _arg_3.index;
                if (_arg_3.type == 4)
                {
                    refreshFolderEntry(_arg_1, _arg_3);
                }
                else
                {
                    refreshNormalEntry(_arg_1, _arg_3);
                };
                _arg_1.visible = true;
            }
            else
            {
                _arg_1.height = 0;
                _arg_1.visible = false;
            };
        }

        private function refreshNormalEntry(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1549):void
        {
            refreshCell(_arg_1, _arg_2);
            refreshDetails(_arg_1, _arg_2);
            refreshUserCount(_arg_1, _arg_2);
            _arg_1.height = 68;
        }

        private function refreshFolderEntry(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1549):void
        {
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("folder_cont"));
            _local_3.visible = true;
            var _local_5:ITextWindow = ITextWindow(_local_3.findChildByName("folder_name_text"));
            _local_5.text = _arg_2.popupCaption;
            var _local_6:ITextWindow = ITextWindow(_local_3.findChildByName("arrow_label"));
            _local_6.text = ((_arg_2.open) ? "${navigator.folder.hide}" : "${navigator.folder.show}");
            _navigator.refreshButton(_local_3, "arrow_down_white", _arg_2.open, null, 0);
            _navigator.refreshButton(_local_3, "arrow_right_white", (!(_arg_2.open)), null, 0);
            this.refreshFolderImage(_local_3, _arg_2);
            _arg_1.height = 68;
            var _local_4:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("folderNameContainer"));
            if (_local_5.text == "")
            {
                _local_4.visible = false;
                return;
            };
            _local_4.visible = true;
            if (!_navigator.isPerkAllowed("NAVIGATOR_PHASE_ONE_2014"))
            {
                _local_4.width = (_local_5.textWidth + 20);
            };
        }

        private function refreshUserCount(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1549):void
        {
            var _local_4:int;
            var _local_3:int;
            var _local_5:int;
            if (((_arg_2.showDetails) && (_arg_2.type == 2)))
            {
                _local_4 = 3;
                _local_3 = 34;
                _local_5 = 13;
                _SafeStr_5195.refreshUserCount(_arg_2.maxUsers, _arg_1, _arg_2.userCount, "${navigator.usercounttooltip.users}", ((_arg_1.width - _local_4) - _local_3), ((_arg_1.height - _local_4) - _local_5));
            };
        }

        private function refreshCell(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1549):void
        {
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("image_cont"));
            _local_3.visible = true;
            _local_3.width = ((_arg_2.showDetails) ? 65 : 267);
            refreshPicText(_local_3, _arg_2);
            refreshRoomImage(_local_3, _arg_2);
        }

        private function refreshPicText(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1549):void
        {
            var _local_6:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("picTextContainer"));
            if (((_arg_2.picText == "") || (_arg_2.showDetails)))
            {
                _local_6.visible = false;
                return;
            };
            var _local_3:int = 5;
            _local_6.visible = true;
            var _local_4:ITextWindow = ITextWindow(_local_6.findChildByName("picText"));
            _local_4.text = _arg_2.picText;
            _local_4.height = (_local_4.textHeight + 10);
            var _local_5:* = (_local_4.textHeight > 10);
            _local_6.height = (_local_4.height + 4);
        }

        private function refreshFolderImage(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1549):void
        {
            var _local_3:_SafeStr_3264 = _SafeStr_3264(_arg_1.findChildByName("folder_image"));
            _local_3.visible = false;
            if (_arg_2.picRef != "")
            {
                refreshCustomImage(_arg_2, _local_3);
            };
        }

        private function refreshRoomImage(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1549):void
        {
            var _local_3:_SafeStr_3264 = _SafeStr_3264(_arg_1.findChildByName("room_image"));
            _local_3.visible = false;
            if (_arg_2.picRef != "")
            {
                refreshCustomImage(_arg_2, _local_3);
            }
            else
            {
                if (_arg_2.guestRoomData != null)
                {
                    refreshGuestRoomImage(_arg_1, _arg_2, _local_3);
                }
                else
                {
                    refreshEmptyImage(_arg_1, _arg_2, _local_3);
                };
            };
        }

        private function refreshCustomImage(_arg_1:_SafeStr_1549, _arg_2:_SafeStr_3264):void
        {
            var _local_4:String = ("customImage." + _arg_1.picRef);
            if (_arg_2.tags[0] == _local_4)
            {
                _arg_2.visible = true;
                return;
            };
            _SafeStr_14.log(("Loading custom image: " + _arg_1.picRef));
            _arg_2.x = 0;
            _arg_2.visible = false;
            var _local_3:OfficialRoomImageLoader = new OfficialRoomImageLoader(_navigator, _arg_1.picRef, _arg_2);
            _local_3.startLoad();
            _arg_2.tags.splice(0, _arg_2.tags.length);
            _arg_2.tags.push(_local_4);
        }

        private function refreshGuestRoomImage(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1549, _arg_3:_SafeStr_3264):void
        {
            var _local_4:String = ("guestRoom." + _arg_2.guestRoomData.thumbnail.getAsString());
            if (_arg_3.tags[0] == _local_4)
            {
                _arg_3.visible = true;
                return;
            };
            _SafeStr_14.log("Redrawing guest room image");
            _arg_3.x = 0;
            _arg_3.width = 64;
            _arg_3.bitmap = new BitmapData(64, 64);
            _arg_3.bitmap.fillRect(_arg_3.bitmap.rect, 0xFFFFFFFF);
            _arg_3.tags.splice(0, _arg_3.tags.length);
            _arg_3.tags.push(_local_4);
            _arg_3.visible = true;
        }

        private function refreshEmptyImage(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1549, _arg_3:_SafeStr_3264):void
        {
            var _local_4:String = "empty";
            if (_arg_3.tags[0] == _local_4)
            {
                _arg_3.visible = true;
                return;
            };
            _SafeStr_14.log("Redrawing empty image");
            _arg_3.x = 0;
            _arg_3.width = 64;
            _arg_3.bitmap = new BitmapData(64, 64, false, 4291611852);
            _arg_3.tags.splice(0, _arg_3.tags.length);
            _arg_3.tags.push(_local_4);
            _arg_3.visible = true;
        }

        private function onCellMouseOver(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3109 = _arg_1.target;
            this.setEnterArrowVisibility(_local_2, true);
        }

        private function onCellMouseOut(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3109 = _arg_1.target;
            this.setEnterArrowVisibility(_local_2, false);
        }

        private function onCellMouseClick(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3109 = _arg_1.target;
            this.handleClick(_local_2);
        }

        private function setEnterArrowVisibility(_arg_1:_SafeStr_3109, _arg_2:Boolean):void
        {
            var _local_4:* = null;
            var _local_5:_SafeStr_3133 = _SafeStr_3133(_arg_1);
            if (_local_5 == null)
            {
                return;
            };
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_local_5.findChildByName("enter_room"));
            if (_local_3 == null)
            {
                return;
            };
            if (_arg_2)
            {
                _navigator.refreshButton(_local_3, "enter_room_l", true, null, 0);
                _navigator.refreshButton(_local_3, "enter_room_r", true, null, 0);
                _local_4 = _SafeStr_3264(_local_3.findChildByName("enter_room_m"));
                if (_local_4.bitmap == null)
                {
                    _local_4.bitmap = _navigator.getButtonImage("enter_room_m");
                    _local_4.disposesBitmap = false;
                };
                _navigator.refreshButton(_local_3, "enter_room_a", true, null, 0);
            };
            _local_3.visible = _arg_2;
        }

        private function handleClick(_arg_1:_SafeStr_3109):void
        {
            var _local_2:_SafeStr_1549 = this.getEntry(_arg_1);
            if (_local_2 == null)
            {
                return;
            };
            if (_local_2.guestRoomData != null)
            {
                _SafeStr_14.log(("ENTERING ROOM: " + _local_2.guestRoomData.flatId));
                if (_local_2.guestRoomData.doorMode == 2)
                {
                    _navigator.passwordInput.show(_local_2.guestRoomData);
                }
                else
                {
                    _navigator.goToRoom(_local_2.guestRoomData.flatId, true);
                };
            }
            else
            {
                if (_local_2.tag != null)
                {
                    _SafeStr_14.log(("MAKING TAG SEARCH: " + _local_2.tag));
                    if (_local_2.tag == "hottest_groups")
                    {
                        _navigator.performGuildBaseSearch();
                    }
                    else
                    {
                        _navigator.mainViewCtrl.startSearch(5, 9, _local_2.tag);
                    };
                }
                else
                {
                    _SafeStr_14.log(("FOLDER CLICKD: " + _local_2.index));
                    _local_2.toggleOpen();
                    this._navigator.mainViewCtrl.refresh();
                };
            };
        }

        private function getEntry(_arg_1:_SafeStr_3109):_SafeStr_1549
        {
            var _local_2:_SafeStr_3133 = (_arg_1 as _SafeStr_3133);
            if (((_local_2 == null) || (!(_local_2.name == "cont"))))
            {
                _SafeStr_14.log("Target not cont");
                return (null);
            };
            _SafeStr_14.log(("PARENT NAME: " + _arg_1.parent.name));
            return ((_local_2.parent.name == "ad_cont") ? findAdEntry() : findEntryInOfficialRoomList(_local_2));
        }

        private function findAdEntry():_SafeStr_1549
        {
            return (_navigator.data.adRoom);
        }

        private function findEntryInOfficialRoomList(_arg_1:_SafeStr_3133):_SafeStr_1549
        {
            if (_navigator.data.officialRooms == null)
            {
                _SafeStr_14.log("No official rooms data click");
                return (null);
            };
            var _local_3:int = _arg_1.id;
            _SafeStr_14.log(("Got index: " + _local_3));
            for each (var _local_2:_SafeStr_1549 in _navigator.data.officialRooms.entries)
            {
                if (_local_2.index == _local_3)
                {
                    return (_local_2);
                };
            };
            _SafeStr_14.log(((("No room found " + _local_3) + ", ") + _navigator.data.officialRooms.entries.length));
            return (null);
        }

        private function refreshDetails(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1549):void
        {
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("details_container"));
            _local_3.visible = _arg_2.showDetails;
            _SafeStr_14.log(("Refreshing details: " + _local_3.visible));
            if (!_arg_2.showDetails)
            {
                return;
            };
            Util.hideChildren(_local_3);
            refreshEntryCaption(_local_3, _arg_2);
            refreshEntryDesc(_local_3, _arg_2);
        }

        private function refreshEntryCaption(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1549):void
        {
            var _local_3:ITextWindow = ITextWindow(_arg_1.getChildByName("entry_caption"));
            _local_3.visible = true;
            _local_3.text = getPopupCaption(_arg_2);
        }

        private function refreshEntryDesc(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1549):void
        {
            var _local_4:String = getPopupDesc(_arg_2);
            if (_local_4 == "")
            {
                return;
            };
            var _local_3:String = "entry_desc";
            var _local_5:ITextWindow = ITextWindow(_arg_1.getChildByName(_local_3));
            _local_5.text = _local_4;
            _local_5.visible = true;
        }

        public function getPopupCaption(_arg_1:_SafeStr_1549):String
        {
            if (((!(_arg_1.popupCaption == null)) && (!(_arg_1.popupCaption == ""))))
            {
                return (_arg_1.popupCaption);
            };
            if (_arg_1.guestRoomData != null)
            {
                return (_arg_1.guestRoomData.roomName);
            };
            if (((!(_arg_1.tag == null)) && (!(_arg_1.tag == ""))))
            {
                return (_arg_1.tag);
            };
            return ("NA");
        }

        public function getPopupDesc(_arg_1:_SafeStr_1549):String
        {
            if (((!(_arg_1.popupCaption == null)) && (!(_arg_1.popupCaption == ""))))
            {
                return (_arg_1.popupDesc);
            };
            if (_arg_1.guestRoomData != null)
            {
                return (_arg_1.guestRoomData.description);
            };
            return ("");
        }


    }
}//package com.sulake.habbo.navigator.mainview

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1549 = "_-jk" (String#3003, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_5195 = "_-uW" (String#2551, DoABC#4)


