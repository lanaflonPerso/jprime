package site.config;

import site.controller.CfpController;
import site.controller.TicketsController;
import site.model.Branch;

public class Globals {
	public static final Branch CURRENT_BRANCH = Branch.YEAR_2020;
	public static final String PAGE_CFP = CfpController.CFP_OPEN_JSP;
	public static final String PAGE_TICKETS = TicketsController.TICKETS_END_JSP;
}
