<c:forTokens items="${book.ratingStars}" delims="," var="star">
                     <c:if test="${star eq 'on'}">
                        <i class="fa fa-star" style="color: #e1ff00;"></i> 
                     </c:if>
                     <c:if test="${star eq 'off'}">
                         <i class="fa fa-star" style="color: #c3c6d1;"></i>
                     </c:if>
                     <c:if test="${star eq 'half'}">
                      <i class="fa fa-star-half-o" style="color: #e1ff00;"></i>
                     </c:if>
 </c:forTokens>