<aura:application extends="FORCE:SLDS">
    <lightning:notificationsLibrary aura:id="notifLib"/>
    <lightning:tabset>
        <lightning:tab label="Search Ticket">
            <span><c:TicketSearchComponent/></span>
        </lightning:tab>
        <lightning:tab label="Book Ticket">
            <div class="slds-grid slds-gutters">
        	<div class="slds-col">
            	<span><c:SearchCustomer/></span>
        	</div>
        	<div class="slds-col">
            	<span><c:BookTicketComponent/></span>
        	</div>
    	</div>
        </lightning:tab>
    </lightning:tabset>
    
</aura:application>